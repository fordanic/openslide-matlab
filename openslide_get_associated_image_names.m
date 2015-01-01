function [associatedImages] = openslide_get_associated_image_names(...
    openslidePointer)
% OPENSLIDE_GET_ASSOCIATED_IMAGE_NAMES Returns a list of associated images
%
% [associatedImages] = openslide_get_associated_image_names(openslidePointer)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to the openslide object to read associated 
%                             image names from
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% associatedImages          - Cell list with names of associated images

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

% Read list of associated image names
[stringArray, ~] = calllib('openslidelib','openslide_get_associated_image_names',...
    openslidePointer);

% Check for errors
[errorMessage] = openslide_get_error(openslidePointer);

% Terminate if an error was returned
if ~isempty(errorMessage)
    error('openslide:openslide_get_associated_image_names',errorMessage)
end

% Parse the array
ptrInd = stringArray;
ind = 1; 

% Stop at end of list (NULL)
while ischar(ptrInd.value{1}) 
    associatedImages{ind} = ptrInd.value{1};
    % Increment pointer 
    ptrInd = ptrInd + 1; 
    % Increment array index
    ind = ind + 1; 
end
