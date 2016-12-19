function [mppX,mppY,width,height,numberOfLevels,...
    downsampleFactors,objectivePower] = ...
    openslide_get_slide_properties(openslidePointer)
% OPENSLIDE_GET_SLIDE_PROPERTIES Reads some basics properties from openslide object
%
% [mppX,mppY,width,height,numberOfLevels,...
%     downsampleFactors,objectivePower] = ...
%     openslide_get_slide_properties(openslidePointer)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to the openslide object to read properties from
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% mppX                      - Resolution, microns per pixel
% mppY                      - Resolution, microns per pixel
% width                     - Size in pixels
% height                    - Size in pixels
% numberOfLevels            - Number of levels available
% downsampleFactors         - Downsample factors of the levels available
% objectivePower            - Magnification factor for level 0

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

%% mpp
% Read microns per pixel along x-axis
mppX = str2double(openslide_get_property_value(openslidePointer,'openslide.mpp-x'));

% Read microns per pixel along y-axis
mppY = str2double(openslide_get_property_value(openslidePointer,'openslide.mpp-y'));

%% size
% Read size of whole-slide image
[width, height] = openslide_get_level0_dimensions(openslidePointer);

%% number of zoom levels
% Read number of zoom levels
[numberOfLevels] = openslide_get_level_count(openslidePointer);

%% downsample factors
% Read downsample factors for each available zoom level
downsampleFactors = zeros(numberOfLevels,1);
for level = 0 : numberOfLevels - 1
    downsampleFactors(level+1) = openslide_get_level_downsample(openslidePointer,level);
end

%% objective power
% Read objective power of level 0
objectivePower = str2double(openslide_get_property_value(...
    openslidePointer,'openslide.objective-power'));
