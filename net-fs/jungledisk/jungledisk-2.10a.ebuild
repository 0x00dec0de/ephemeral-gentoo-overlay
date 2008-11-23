# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Networked storage/backup using Amazon's S3 service."
HOMEPAGE="http://www.jungledisk.com"
SRC_URI="http://downloads.jungledisk.com/jungledisk/${PN}.tar.gz"

LICENSE="jungledisk"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND="sys-fs/fuse"

RESTRICT="primaryuri binchecks strip"

S="${WORKDIR}/${PN}"

src_install() {
	dodir /opt/jungledisk
	exeinto /opt/jungledisk
	doexe jungledisk junglediskmonitor
	dosym /opt/jungledisk/jungledisk /usr/bin/jungledisk
	dosym /opt/jungledisk/junglediskmonitor /usr/bin/junglediskmonitor
	insinto /usr/share/pixmaps
	doins "${FILESDIR}/jungledisk.png"
	make_desktop_entry /usr/bin/junglediskmonitor "Jungle Disk Monitor" \
		/usr/share/pixmaps/jungledisk.png "Utility"
	newdoc INSTALL README
}

pkg_postinst() {
	echo
	elog "Your should read the README file which contains"
	elog "detailed instructions for using jungledisk."
	echo
}
