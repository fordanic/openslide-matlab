openslide-matlab
================

A MATLAB library providing bindings to the C library OpenSlide 
(https://github.com/openslide/openslide) used for reading 
whole-slide images.

Copyright (c) 2014 Daniel Forsberg
danne.forsberg@outlook.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

ABOUT
================
This library contains MATLAB bindings to the C library OpenSlide, 
which is used to read image data from digital whole-slide images.

INSTALLATION
================
Add the folder and any sub folders to the MATLAB path. Also download 
source code or binaries for OpenSlide from http://openslide.org/download/. 
If downloading the source, make sure to follow instructions provided by 
OpenSlide for compiling the binaries. Remember to also add the folders
of these libraries and the include files to the MATLAB path. 

If using release 3.4 or older, make sure to edit the openslide.h 
so that '#include <openslide-features.h>' reads 
'#include "openslide-features.h"' instead.

When running openslide_load_library a wrapper header file will be 
created in the openslide MATLAB repository. This file is needed 
as wrapper to avoid some issues with gcc function attributes.

LICENSING
================
Source code provided in this repository is generally released under 
the GNU GENERAL PUBLIC LICENSE Version 3, if not otherwise stated.
