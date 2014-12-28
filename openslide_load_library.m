function openslide_load_library()
% OPENSLIDE_LOAD_LIBRARY Loads the openslide library
%
% openslide_load_library()
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

% Check if library is already loaded
if libisloaded('openslidelib');
    fprintf('Openslide library is already loaded\n')
    return
end

% Load library
loadlibrary('libopenslide-0.dll','openslide.h','alias','openslidelib')

% Check success of load
success = libisloaded('openslidelib');

% Notify user of success
if success
    fprintf('Openslide library has been loaded\n')
else
    error('openslide:openslide_read_region',...
        'Failure to load openslide library\n')
end