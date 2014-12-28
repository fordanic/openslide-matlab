function openslide_unload_library()
% OPENSLIDE_UNLOAD_LIBRARY Unloads the open slide library
%
% openslide_unload_library()
%
% INPUT ARGUMENTS
% N/A
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% N/A

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

% Check if library is already loaded
if ~libisloaded('openslidelib');
    disp('Openslide library is not loaded')
    return
end

% Unload library
unloadlibrary('openslidelib')

% Check success of unload
if libisloaded('openslidelib');
    error('openslide:openslide_unload_library',...
        'Failure to unload openslide library\n')
else
    disp('Openslide library has been unloaded')
end