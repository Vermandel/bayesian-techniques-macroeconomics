% Course: Bayesian Techniques in Macroeconomics (2026-2027)
% Instructor: Gauthier Vermandel
% Institution: Universite Paris-Dauphine PSL
%
function [output_table, series_names, T] = btm_call_dbnomics(varargin)
%BTM_CALL_DBNOMICS Fetch and align DBnomics series for this course.
%   [DATA,NAMES,T] = BTM_CALL_DBNOMICS('provider/dataset/series', ...)
%   returns datenums in DATA(:,1), aligned observations thereafter, series
%   names, and a datetime period vector. Missing observations are NaN.

codes = local_codes(varargin{:});
if isempty(codes)
    error('btm_call_dbnomics:NoSeries', 'At least one series code is required.');
end
n = numel(codes);
all_periods = cell(1, n);
all_values = cell(1, n);
series_names = cell(1, n);
for i = 1:n
    [all_periods{i}, all_values{i}, series_names{i}] = local_series(codes{i});
end
T = sort(unique(vertcat(all_periods{:})));
output_table = nan(numel(T), n + 1);
output_table(:, 1) = datenum(T);
for i = 1:n
    [present, row] = ismember(T, all_periods{i});
    output_table(present, i + 1) = all_values{i}(row(present));
end
end

function codes = local_codes(varargin)
if nargin == 1 && (iscell(varargin{1}) || isstring(varargin{1}))
    codes = cellstr(varargin{1});
else
    codes = varargin;
end
codes = codes(:).';
end

function [periods, values, name] = local_series(code)
url = ['https://api.db.nomics.world/v22/series/' char(code) ...
    '?observations=1&align_periods=1'];
payload = webread(url, weboptions('Timeout', 60));
if ~isfield(payload, 'series') || ~isfield(payload.series, 'docs') ...
        || isempty(payload.series.docs)
    error('btm_call_dbnomics:MissingSeries', ...
        'DBnomics returned no observations for "%s".', code);
end
doc = payload.series.docs(1);
if ~isfield(doc, 'period') || ~isfield(doc, 'value')
    error('btm_call_dbnomics:MalformedResponse', ...
        'DBnomics response for "%s" has no period/value arrays.', code);
end
periods = local_periods(string(doc.period));
values = double(doc.value(:));
if numel(periods) ~= numel(values)
    error('btm_call_dbnomics:LengthMismatch', ...
        'DBnomics returned unequal period and value arrays for "%s".', code);
end
if isfield(doc, 'series_name') && ~isempty(doc.series_name)
    name = char(string(doc.series_name));
else
    name = char(string(code));
end
end

function periods = local_periods(strings)
periods = NaT(numel(strings), 1);
for i = 1:numel(strings)
    s = char(strings(i));
    q = regexp(s, '^(\d{4})-?Q([1-4])$', 'tokens', 'once');
    m = regexp(s, '^(\d{4})-(\d{2})$', 'tokens', 'once');
    y = regexp(s, '^(\d{4})$', 'tokens', 'once');
    if ~isempty(q)
        periods(i) = datetime(str2double(q{1}), 3 * (str2double(q{2}) - 1) + 1, 1);
    elseif ~isempty(m)
        periods(i) = datetime(str2double(m{1}), str2double(m{2}), 1);
    elseif ~isempty(y)
        periods(i) = datetime(str2double(y{1}), 1, 1);
    else
        periods(i) = datetime(s);
    end
end
end
