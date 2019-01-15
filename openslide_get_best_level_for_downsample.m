function [level] = openslide_get_best_level_for_downsample(openslidePointer, downsamplingFactor)
% OPENSLIDE_GET_BEST_LEVEL_FOR_DOWNSAMPLE Determine the most suitable level given a downsampling factor
%
% [level] = openslide_get_best_level_for_downsample(openslidePointer, downsamplingFactor)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to openslide object to read from
% downsamplingFactor        - Preferred downsampling factor
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% level                     - Most suitable level


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

% Call get best level for downsample
[level] = calllib('openslidelib',...
    'openslide_get_best_level_for_downsample',openslidePointer,downsamplingFactor);

% Check for errors
[errorMessage] = openslide_get_error(openslidePointer);

% Terminate if an error was returned
if ~isempty(errorMessage)
    error('openslide:openslide_get_best_level_for_downsample',errorMessage)
end
