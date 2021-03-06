# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2:2.4"

inherit gnome2 python

DESCRIPTION="Support for making Gmail the default mail application for the GNOME desktop."
HOMEPAGE="http://gnome-gmail.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/Version_${PV}/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="nls"

DEPEND="${RDEPEND}
		>=dev-util/intltool-0.23
		>=dev-lang/perl-5.8.1
		dev-python/gnome-keyring-python
		dev-python/gconf-python"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
	G2CONF="${G2CONF} $(use_enable nls)"
	DOCS="AUTHORS ChangeLog NEWS README"
}

src_prepare() {
	python_convert_shebangs -r 2 .
}
