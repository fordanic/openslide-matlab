function [openslideVersion] = openslide_get_version()
% OPENSLIDE_GET_VERSION Determine version of used openslide library
%
% [openslideVersion] = openslide_get_version()
%
% INPUT ARGUMENTS
% N/a
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% openslideVersion          - Current openslide library version


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

% Call get version
[openslideVersion] = calllib('openslidelib','openslide_get_version');