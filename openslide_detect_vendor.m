function [vendor] = openslide_detect_vendor(slideName)
% OPENSLIDE_DETECT_VENDOR Determine vendor of the whole-slide image
%
% [vendor] = openslide_detect_vendor(slideName)
%
% INPUT ARGUMENTS
% slideName         - Full file name of whole-slide image to interact with, i.e.
%                     including full path and file extension
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% vendor            - Vendor of the whole-slide image

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
% Check if openslide library is loaded
if ~libisloaded('openslidelib')
    warning('OpenSlide library has not been loaded, attempting to load')
    openslide_load_library();
end

% Call detect vendor
[vendor] = calllib('openslidelib','openslide_detect_vendor',slideName);