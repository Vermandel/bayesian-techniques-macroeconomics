function [output_table, series_names, T] = btm_call_dbnomics(varargin)
%BTM_CALL_DBNOMICS Fetch aligned DBnomics series for the course material.
%   [DATA, NAMES, T] = BTM_CALL_DBNOMICS(code1, code2, ...)
%   downloads each DBnomics series through the public Web API, aligns the
%   periods, and returns:
%     - DATA: numeric matrix with datenum in column 1 and observations in
%       the remaining columns;
%     - NAMES: cell array of series names when available;
%     - T: datetime vector of aligned periods.

    codes = local_series_codes(varargin{:});
    nSeries = numel(codes);
    if nSeries == 0
        error('btm_call_dbnomics:NoSeries', 'At least one series code is required.');
    end

    period_lists = cell(1, nSeries);
    value_lists = cell(1, nSeries);
    series_names = cell(1, nSeries);

    for i = 1:nSeries
        payload = local_fetch_series(codes{i});
        [period_lists{i}, value_lists{i}, series_names{i}] = local_extract_series(payload, codes{i});
    end

    T = unique([period_lists{:}]);
    T = sort(T);

    output_table = nan(numel(T), nSeries + 1);
    output_table(:,1) = datenum(T);

    for i = 1:nSeries
        [present, location] = ismember(T, period_lists{i});
        output_table(present, i + 1) = value_lists{i}(location(present));
    end
end

function codes = local_series_codes(varargin)
    if nargin == 1 && (iscell(varargin{1}) || isstring(varargin{1}))
        codes = cellstr(varargin{1});
    else
        codes = varargin;
    end
    codes = codes(:).';
end

function payload = local_fetch_series(code)
    url = ['https://api.db.nomics.world/v22/series/' char(code) '?observations=1&align_periods=1'];
    options = weboptions('Timeout', 60);
    payload = webread(url, options);
end

function [periods, values, series_name] = local_extract_series(payload, code)
    if ~isfield(payload, 'series') || ~isfield(payload.series, 'docs') || isempty(payload.series.docs)
        error('btm_call_dbnomics:MissingSeries', 'DBnomics did not return observations for "%s".', code);
    end

    docs = payload.series.docs;
    if numel(docs) > 1
        warning('btm_call_dbnomics:MultipleDocs', ...
            'Series "%s" returned %d docs; using the first one.', code, numel(docs));
    end

    doc = docs(1);
    periods = local_parse_periods(string({doc.period}));
    values = arrayfun(@(d) local_numeric_value(d.value), doc);

    if isfield(doc, 'series_name') && ~isempty(doc.series_name)
        series_name = char(string(doc.series_name));
    else
        series_name = char(string(code));
    end
end

function periods = local_parse_periods(period_strings)
    n = numel(period_strings);
    periods = NaT(n, 1);
    for i = 1:n
        periods(i) = local_parse_period(period_strings(i));
    end
end

function dt = local_parse_period(period_string)
    s = char(period_string);
    if isempty(s)
        dt = NaT;
        return;
    end

    q = regexp(s, '^(\d{4})-?Q([1-4])$', 'tokens', 'once');
    if ~isempty(q)
        dt = datetime(str2double(q{1}), (str2double(q{2}) - 1) * 3 + 1, 1);
        return;
    end

    m = regexp(s, '^(\d{4})-(\d{2})$', 'tokens', 'once');
    if ~isempty(m)
        dt = datetime(str2double(m{1}), str2double(m{2}), 1);
        return;
    end

    y = regexp(s, '^(\d{4})$', 'tokens', 'once');
    if ~isempty(y)
        dt = datetime(str2double(y{1}), 1, 1);
        return;
    end

    try
        dt = datetime(s);
    catch
        dt = NaT;
    end
end

function value = local_numeric_value(raw_value)
    if isempty(raw_value)
        value = NaN;
        return;
    end

    if isnumeric(raw_value)
        value = double(raw_value);
        return;
    end

    value = str2double(string(raw_value));
end
