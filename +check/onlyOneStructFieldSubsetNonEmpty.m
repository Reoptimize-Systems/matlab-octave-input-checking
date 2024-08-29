function ok = onlyOneStructFieldSubsetNonEmpty(S, field_names, throw, inputname)
% checks if a subset of fields in a structure have only one non-emty member
%
% Syntax
%
% result = check.onlyOneStructFieldSubsetNonEmpty (S, field_names, throw, inputname)
%
% Description
%
% check.onlyOneStructFieldSubsetNonEmpty checks if a subset of fields in a
% structure have only one non-emty member. This can be useful when testing
% mutually exclusive input options to functions etc.
%
% Input
%
%  S - test structure containing the fields
%
%  field_names - cell array of character vectors containing the subset of
%   fields to test.
%
%  throw - logical flag determining whether an error is thrown by
%    onlyOneStructFieldSubsetNonEmpty if input fails check
%
%  inputname - (optional) string with name to use in error thrown by
%   onlyOneStructFieldSubsetNonEmpty.
%
% Output
%
%  ok - logical flag indicating if check was passed
%
%
%
% See Also: 
%

    if nargin < 4
        inputname = 'input';
    end

    non_empty_fields = cellfun(@(fname) ~isempty(S.(fname)), field_names, 'UniformOutput', true);

    ok = true;
    if sum(non_empty_fields) > 1

        ok = false;

        if throw
            all_fields = strjoin(field_names, ', ');
            non_empty_field_names = strjoin(field_names(non_empty_fields), ', ');
            error ('The following fields in the structure %s must only have one non-empty member:\n  %s\nHowever, the following multiple fields are non-empty:\n  %s', ...
                   inputname, ...
                   all_fields, ...
                   non_empty_field_names ...
            );
        end

    end

end