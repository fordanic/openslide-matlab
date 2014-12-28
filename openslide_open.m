function openslidePointer = openslide_open(slideName)
% OPENSLIDE_OPEN Opens a slide for interaction
%
% openslidePointer = openslide_open(slideName)
%
% INPUT ARGUMENTS
% slideName         - Full file name of slide to interact with
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% openslidePointer  - Pointer to slide to interact with

% Copyright (c) 2013 Daniel Forsberg
% daniel.forsberg@liu.se
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
    error('openslide:openslide_read_region',...
        'Make sure to load the openslide library first\n')
end

% Check if slide can be opened
canOpenSlide = calllib('openslidelib','openslide_can_open',slideName);

% Notify user if unable to open slide
if ~canOpenSlide
    errorMessage = ['Unable to open the specified slide: ',slideName,'\n'];
    error('openslide:openslide_read_region',errorMessage)
end

% Get pointer to slide
openslidePointer = calllib('openslidelib','openslide_open',slideName);