function openslidePointer = openslide_open(slideName)
% OPENSLIDE_OPEN Opens a whole-slide image for interaction
%
% openslidePointer = openslide_open(slideName)
%
% INPUT ARGUMENTS
% slideName         - Full file name of whole-slide image to interact with, i.e.
%                     including path and file extension
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% openslidePointer  - Pointer to whole-slide image to interact with, to be used
%                     as input argument in other openslide funcions

% Copyright (c) 2013 Daniel Forsberg
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

% Check if library for openslide is already loaded
if ~libisloaded('openslidelib')
    warning('OpenSlide library has not been loaded, attempting to load')
    openslide_load_library();
end

% Get pointer to whole-slide image
openslidePointer = calllib('openslidelib','openslide_open',slideName);

% Check validity of returned pointer
if isempty(openslidePointer)
    errorMessage = ['Unable to open the specified slide: ',slideName,'\n'];
    error('openslide:openslide_open',errorMessage)
end

% Check for errors
[errorMessage] = openslide_get_error(openslidePointer);

% Terminate if an error was returned
if ~isempty(errorMessage)
    error('openslide:openslide_open',errorMessage)
end