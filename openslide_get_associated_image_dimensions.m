function [width, height] = openslide_get_associated_image_dimensions(openslidePointer,imageName)
% OPENSLIDE_GET_ASSOCIATED_IMAGE_DIMENSIONS Gets the dimensions of the associated image
%
% [width, height] = openslide_get_associated_image_dimensions(openslidePointer,imageName)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to openslide object to read from
% imageName                 - Associated image name to read from
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% width                     - Image width
% height                    - Image Height

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

% Check if library for openslide is already loaded
if ~libisloaded('openslidelib')
    warning('OpenSlide library has not been loaded, attempting to load')
    openslide_load_library();
end

% Check image name
if iscell(imageName)
    warning(['Provided imageName argument is a cell object. ',...
        'Attempts to use data from the first cell as imageName argument']);
    imageName = imageName{1};
end
if ~ischar(imageName)
    error('openslide:openslide_get_associated_image_dimensions',...
        'Provided imageName argument is not a valid char array.\n')
end

% See if provided image name is in the list of available associated images
imageNames = openslide_get_associated_image_names(openslidePointer);
if sum(strcmpi(imageName,imageNames)) == 0
    error('openslide:openslide_get_associated_image_dimensions',...
        'Provided imageName argument is not a valid associated image name for this openslide object.\n')
end

% Read size of associated image
width = 0;
height = 0;
[~, ~, width, height] = calllib('openslidelib',...
    'openslide_get_associated_image_dimensions',openslidePointer,imageName,...
    width,height);
    
% Check for errors
[errorMessage] = openslide_get_error(openslidePointer);

% Terminate if an error was returned
if ~isempty(errorMessage)
    error('openslide:openslide_get_associated_image_dimensions',errorMessage)
end