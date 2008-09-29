# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Low-Level Interface to bzip2 compression library."
HOMEPAGE="http://search.cpan.org/search?query=Compress-Raw-Bzip2&mode=dist"
SRC_URI="mirror://cpan/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"

IUSE=""

S=${WORKDIR}/Compress-Raw-Bzip2-${PV}

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc sparc-fbsd x86 x86-fbsd"

