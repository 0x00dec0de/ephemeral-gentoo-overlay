# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=0
NEED_PYTHON="2.3"

inherit eutils python

DESCRIPTION="Easy to use, all-in-one GUI tool for creating audio CDs from analog sources like vinyl records."
HOMEPAGE="http://klappnase.bubble.org/phonoripper/index.html"
SRC_URI="http://klappnase.bubble.org/phonoripper/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="cdr normalize"

DEPEND=">=dev-lang/tcl-8.4
		>=dev-lang/tk-8.4
		dev-tcltk/tkimg
		>=dev-tcltk/tktreectrl-2.2.3
		dev-tcltk/snack
		dev-python/imaging
		cdr? ( app-cdr/cdrdao )
		normalize? ( media-sound/normalize )"

src_install() {
	# fix some issues in the install script
	sed -i -e "s:^phonoversion.*:phonoversion = '${PV}':" \
		-e "s:/usr/local:${D}usr:g" \
		-e "s:/usr/share/pixmaps:${D}usr/share/pixmaps:" \
		install \
		|| die "sed install script failed."
	${python} ./install || die "python install failed."
	# remove the link in /usr/bin created by the install script
	# and do the link manually
	rm -f ${D}usr/bin/phonoripper \
		|| die "failed to remove broken executable link."
	dosym /usr/share/${PN}-${PV}/${PN}.py /usr/bin/${PN} \
		|| die "failed to create executable link."
	dosym /usr/share/${PN}-${PV}/icons/${PN}.png \
		/usr/share/pixmaps/${PN}.png \
		|| die "failed to link application icon."
	make_desktop_entry /usr/bin/${PN} Phonoripper \
		/usr/share/pixmaps/${PN}.png \
		'Application;AudioVideo;Audio;AudioVideoEditing;'
}
