function [propertyValue] = ...
    openslide_get_property_value(openslidePointer, propertyName)
% OPENSLIDE_GET_PROPERTY_VALUE Returns the value of a single property
%
% [propertyValue] = openslide_get_property_value(openslidePointer, propertyName)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to the slide to read properties from
% propertyName              - Property to retrieve value for
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% propertyValue             - Value of specified property name. Note that
%                             this value might have to be type casted 
%                             before it can be used.

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

% Check if openslide library is opened
if ~libisloaded('openslidelib')
    error('openslide:openslide_read_region',...
        'Make sure to load the openslide library first\n')
end

% Read property value
[propertyValue, ~] = calllib('openslidelib','openslide_get_property_value',...
    openslidePointer,propertyName);