function openslide_close(openslidePointer)
% OPENSLIDE_CLOSE Closes the currently open slide
%
% INPUT ARGUMENTS
% openslidePointer      - Pointer to the slide to close
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

% Check if openslide library is loaded
if ~libisloaded('openslidelib')
    error('openslide:openslide_read_region',...
        'Make sure to load the openslide library first\n')
end

% Close slide
calllib('openslidelib','openslide_close',openslidePointer);