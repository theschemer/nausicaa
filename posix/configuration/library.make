#
# Part of: Nausicaa/POSIX
# Contents: project specific makefile for shared library
# Date: Thu Nov 12, 2009
#
# Abstract
#
#
#
# Copyright (c) 2009 Marco Maggi <marcomaggi@gna.org>
#
# This program is  free software: you can redistribute  it and/or modify
# it under the  terms of the GNU General Public  License as published by
# the Free Software Foundation, either  version 3 of the License, or (at
# your option) any later version.
#
# This program  is distributed in the  hope that it will  be useful, but
# WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
# MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU
# General Public License for more details.
#
# You  should have received  a copy  of the  GNU General  Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#page
## --------------------------------------------------------------------
## Stub library.
## --------------------------------------------------------------------

posix_stub_SRCDIR	= $(srcdir)/src/posix-stub
posix_stub_BUILDDIR	= $(builddir)/posix-objects.d

posix_stub_PREREQUISITES = $(wildcard $(posix_stub_SRCDIR)/*.h)

$(eval $(call ds-c-library,posix_stub))

# This is needed to test.
nau_test_LDPATH=$(posix_stub_shlib_BUILDDIR)

.PHONY: library stub stub-library

library stub stub-library: posix_stub_shlib-all

### end of file
# Local Variables:
# mode: makefile-gmake
# End: