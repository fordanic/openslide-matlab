function [propertyNames] = ...
    openslide_get_property_names(openslidePointer)
% OPENSLIDE_GET_PROPERTY_NAMES Returns a list of all available property names for current openslide objects
%
% [propertyNames] = openslide_get_property_names(openslidePointer)
%
% INPUT ARGUMENTS
% openslidePointer          - Pointer to the openslide object to read properties from
%
% OPTIONAL INPUT ARGUMENTS
% N/A
%
% OUTPUT
% propertyNames             - Cell list with all avaiable property names

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

% Make sure library for openslide is loaded
if ~libisloaded('openslidelib')
    warning('OpenSlide library has not been loaded, attempting to load')
    openslide_load_library();
end

% Read list of available properties
[stringArray, ~] = calllib('openslidelib','openslide_get_property_names',...
    openslidePointer);

% Check for errors
[errorMessage] = openslide_get_error(openslidePointer);

% Terminate if an error was returned
if ~isempty(errorMessage)
    error('openslide:openslide_get_property_names',errorMessage)
end

% Parse the array
ptrInd = stringArray;
ind = 1; 

% Stop at end of list (NULL)
while ischar(ptrInd.value{1}) 
    propertyNames{ind} = ptrInd.value{1};
    % Increment pointer 
    ptrInd = ptrInd + 1; 
    % Increment array index
    ind = ind + 1; 
end