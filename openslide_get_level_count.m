function [numberOfLevels] = openslide_get_level_count(openslidePointer)
% OPENSLIDE_GET_LEVEL_COUNT Determine number of available image levels
%
% [numberOfLevels] = openslide_get_level_count(openslidePointer)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to openslide object to read from
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% numberOfLevels            - Number of levels available

% Copyright (c) 2016 Daniel Forsberg
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
% Make sure library for openslide is loaded
if ~libisloaded('openslidelib')
    warning('OpenSlide library has not been loaded, attempting to load')
    openslide_load_library();
end

% Call get level count
[numberOfLevels] = calllib('openslidelib','openslide_get_level_count',...
    openslidePointer);

% Check for errors
[errorMessage] = openslide_get_error(openslidePointer);

% Terminate if an error was returned
if ~isempty(errorMessage)
    error('openslide:openslide_get_level_count',errorMessage)
end
