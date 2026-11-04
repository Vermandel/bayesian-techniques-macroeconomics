function [output_mat, output_table, dates_nb] = call_dbnomics(varargin)
%CALL_DBNOMICS Download and align one or more DBnomics series.
%   [OUTPUT_MAT, OUTPUT_TABLE, DATES_NB] = CALL_DBNOMICS(SLUG1, SLUG2, ...)
%   downloads DBnomics slugs of the form provider/dataset/series.
%   Use '+' in one dimension to request several codes, e.g. ...AT+BE+DE.
%
%   OUTPUT_MAT has MATLAB datenums in column 1 and observations thereafter.
%   OUTPUT_TABLE has the observations, with date labels as row names.
%   DATES_NB is a readable annual/monthly/quarterly numeric time vector.

if nargin == 0
    error('call_dbnomics:NoSeries', 'Provide at least one DBnomics slug.');
end
slugs = local_expand_slugs(varargin);
n = numel(slugs);
all_dates = cell(n, 1);
all_values = cell(n, 1);
names = cell(n, 1);
frequency = '';

for i = 1:n
    [all_dates{i}, all_values{i}, names{i}, this_frequency] = local_download(slugs{i});
    if isempty(frequency)
        frequency = this_frequency;
    elseif ~strcmp(frequency, this_frequency)
        error('call_dbnomics:MixedFrequency', ...
            'All requested series must have the same frequency.');
    end
end

all_time = sort(unique(vertcat(all_dates{:})));
output_mat = nan(numel(all_time), n + 1);
output_mat(:, 1) = all_time;
for i = 1:n
    [present, location] = ismember(all_time, all_dates{i});
    output_mat(present, i + 1) = all_values{i}(location(present));
end

date_labels = local_date_labels(all_time, frequency);
output_table = array2table(output_mat(:, 2:end), ...
    'VariableNames', matlab.lang.makeUniqueStrings(matlab.lang.makeValidName(names)), ...
    'RowNames', date_labels);
dates_nb = local_readable_dates(date_labels, frequency);
end

function slugs = local_expand_slugs(inputs)
slugs = {};
for i = 1:numel(inputs)
    slug = char(string(inputs{i}));
    parts = strsplit(slug, '/');
    if numel(parts) ~= 3
        error('call_dbnomics:InvalidSlug', ...
            '"%s" must have the form provider/dataset/series.', slug);
    end
    dimensions = strsplit(parts{3}, '.');
    expanded = {dimensions};
    for j = 1:numel(dimensions)
        values = strsplit(dimensions{j}, '+');
        if numel(values) > 1
            next = cell(0, 1);
            for k = 1:numel(expanded)
                for l = 1:numel(values)
                    item = expanded{k};
                    item{j} = values{l};
                    next{end + 1, 1} = item; %#ok<AGROW>
                end
            end
            expanded = next;
        end
    end
    for j = 1:numel(expanded)
        slugs{end + 1, 1} = strjoin([parts(1:2), {strjoin(expanded{j}, '.')}], '/'); %#ok<AGROW>
    end
end
end

function [dates, values, name, frequency] = local_download(slug)
url = ['https://api.db.nomics.world/v22/series/' urlencode(slug) '?observations=1'];
try
    response = webread(url, weboptions('Timeout', 60));
catch exception
    error('call_dbnomics:RequestFailed', ...
        'DBnomics request failed for "%s": %s', slug, exception.message);
end

if ~isfield(response, 'series') || ~isfield(response.series, 'docs') || isempty(response.series.docs)
    error('call_dbnomics:MissingSeries', 'No series was returned for "%s".', slug);
end
doc = response.series.docs(1);
if ~isfield(doc, 'period') || ~isfield(doc, 'value')
    error('call_dbnomics:MalformedResponse', ...
        'DBnomics returned no period/value arrays for "%s".', slug);
end
periods = cellstr(string(doc.period));
values = local_numeric_values(doc.value);
if numel(periods) ~= numel(values)
    error('call_dbnomics:LengthMismatch', ...
        'Period and value arrays have different lengths for "%s".', slug);
end
frequency = local_frequency(doc, periods);
dates = local_period_to_datenum(periods, frequency);
parts = strsplit(slug, '/');
dimensions = strsplit(parts{3}, '.');
name = dimensions{end};
end

function values = local_numeric_values(raw)
if iscell(raw)
    values = nan(numel(raw), 1);
    for i = 1:numel(raw)
        if isnumeric(raw{i})
            values(i) = raw{i};
        elseif ~(strcmpi(char(string(raw{i})), 'NA') || isempty(raw{i}))
            values(i) = str2double(raw{i});
        end
    end
else
    values = double(raw(:));
end
end

function frequency = local_frequency(doc, periods)
frequency = '';
for field = {'frequency', 'x_frequency'}
    if isfield(doc, field{1}) && ~isempty(doc.(field{1}))
        frequency = lower(char(string(doc.(field{1}))));
        break
    end
end
first = periods{1};
if ~isempty(regexp(first, '^\d{4}-\d{2}-\d{2}$', 'once'))
    frequency = 'daily';
elseif ~isempty(regexp(first, '^\d{4}-\d{2}$', 'once'))
    frequency = 'monthly';
elseif ~isempty(regexp(first, '^\d{4}(-?Q[1-4])$', 'once'))
    frequency = 'quarterly';
elseif ~isempty(regexp(first, '^\d{4}$', 'once'))
    frequency = 'annual';
end
if ~ismember(frequency, {'daily', 'monthly', 'quarterly', 'annual'})
    error('call_dbnomics:UnsupportedFrequency', ...
        'Unsupported period convention or frequency for "%s".', first);
end
end

function dates = local_period_to_datenum(periods, frequency)
dates = nan(numel(periods), 1);
for i = 1:numel(periods)
    token = periods{i};
    switch frequency
        case 'daily'
            value = sscanf(token, '%d-%d-%d');
            dates(i) = datenum(value(1), value(2), value(3));
        case 'monthly'
            value = sscanf(token, '%d-%d');
            dates(i) = datenum(value(1), value(2), 1);
        case 'quarterly'
            value = regexp(token, '^(\d{4})-?Q([1-4])$', 'tokens', 'once');
            if isempty(value), error('call_dbnomics:InvalidPeriod', 'Invalid quarterly period "%s".', token); end
            dates(i) = datenum(str2double(value{1}), 3 * (str2double(value{2}) - 1) + 1, 1);
        case 'annual'
            dates(i) = datenum(str2double(token), 1, 1);
    end
end
end

function labels = local_date_labels(dates, frequency)
switch frequency
    case 'daily', labels = cellstr(datestr(dates, 'yyyy-mm-dd'));
    case 'monthly', labels = cellstr(datestr(dates, 'yyyy-mm'));
    case 'quarterly'
        labels = cell(numel(dates), 1);
        for i = 1:numel(dates)
            labels{i} = sprintf('%04d-Q%d', year(datetime(dates(i), 'ConvertFrom', 'datenum')), ...
                ceil(month(datetime(dates(i), 'ConvertFrom', 'datenum')) / 3));
        end
    case 'annual', labels = cellstr(datestr(dates, 'yyyy'));
end
end

function readable = local_readable_dates(labels, frequency)
readable = nan(numel(labels), 1);
for i = 1:numel(labels)
    switch frequency
        case 'annual', readable(i) = str2double(labels{i});
        case 'monthly', readable(i) = str2double(labels{i}(1:4)) + (str2double(labels{i}(6:7)) - 1) / 12;
        case 'quarterly', readable(i) = str2double(labels{i}(1:4)) + (str2double(labels{i}(end)) - 1) / 4;
        case 'daily', readable(i) = datenum(labels{i});
    end
end
end
