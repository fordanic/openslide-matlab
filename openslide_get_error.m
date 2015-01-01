function [errorMessage] = openslide_get_error(openslidePointer)
% OPENSLIDE_GET_ERROR Retrieves an error message related to current openslide object
%
% [errorMessage] = openslide_get_error(openslidePointer)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to openslide object to retrieve error for
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% errorMessage              - Retrieved error message, NULL if none is available

% Copyright (c) 2014 Daniel Forsberg
% danne.forsberg@outlook.com
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%%
% Check if openslide library is opened
if ~libisloaded('openslidelib')
    error('openslide:openslide_read_region',...
        'Make sure to load the openslide library first\n')
end

% Retrieve error message associated with current slide
[errorMessage] = calllib('openslidelib','openslide_get_error',openslidePointer);