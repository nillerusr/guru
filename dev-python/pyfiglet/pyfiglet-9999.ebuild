# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="Pure-python FIGlet implementation"
HOMEPAGE="https://pypi.org/project/pyfiglet/ https://github.com/pwaller/pyfiglet"

if [[ "${PV}" == 9999 ]]
then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pwaller/pyfiglet.git"
else
	SRC_URI="https://github.com/pwaller/pyfiglet/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RESTRICT="mirror test"
