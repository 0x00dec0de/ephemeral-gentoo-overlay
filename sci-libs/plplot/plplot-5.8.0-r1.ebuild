# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils cmake-utils fortran

DESCRIPTION="Library of functions that are useful for making scientific plots."
HOMEPAGE="http://plplot.sourceforge.net/"
SRC_URI="mirror://sourceforge/plplot/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="X ada agg cxx fortran gnome ifc itcl itk octave pango
postscript pdf python qhull svg tetex tcl tk threads truetype java
wxwindows"

FORTRAN="gfortran ifc"

RESTRICT="nomirror"

RDEPEND="virtual/libc
		 dev-lang/perl
		 ada? ( virtual/ada )
		 agg? ( x11-libs/agg )
		 java? ( virtual/jre )
		 jpeg? ( media-libs/gd )
		 octave? ( sci-mathematics/octave )
		 pango? ( x11-libs/pango )
		 pdf? ( x11-libs/cairo )
		 png? ( media-libs/gd )
		 postscript? ( x11-libs/cairo )
		 python? ( dev-python/numeric )
		 qhull? ( media-libs/qhull )
		 svg? ( x11-libs/cairo )
		 tetex? ( app-text/jadetex )
		 truetype? ( >=media-libs/freetype-2 )
		 tcl? ( dev-lang/tcl
				itcl? (dev-tcltk/itcl))
		 X? ( x11-libs/libX11
				x11-libs/libXau
				x11-libs/libXdmcp
				tk? ( dev-lang/tk
					  itk? ( dev-tcltk/itk )))"

pkg_setup() {
	if use fortran || use ifc; then
		# check for a fortran compiler if requested
		fortran_pkg_setup
	fi
}


src_compile() {
	mycmakeargs="
$(cmake-utils_use_enable ada ada)
$(cmake-utils_use_enable cxx cxx)
$(cmake-utils_use_enable gnome gnome2)
$(cmake-utils_use_enable itcl itcl)
$(cmake-utils_use_enable itk itk)
$(cmake-utils_use_enable java java)
$(cmake-utils_use_enable octave octave)
$(cmake-utils_use_enable python python)
$(cmake-utils_use_enable tcl tcl)
$(cmake-utils_use_enable tk tk)
$(cmake-utils_use_enable wxwindows wxwidgets)
$(cmake-utils_has agg AGG)
$(cmake-utils_has qhull QHULL)
$(cmake-utils_has threads PTHREAD)
$(cmake-utils_has pango PANGO)"

	# enable fortran if requested
	if use ifc || use fortran; then
		mycmakeargs="$(cmake-utils_use_enable fortran f95)
			${mycmakeargs}"
	fi
	cmake-utils_src_compile -j1
}
