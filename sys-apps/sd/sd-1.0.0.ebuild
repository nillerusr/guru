# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.2
	ansi-to-html@0.1.3
	ansi_term@0.12.1
	anstream@0.6.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	anstyle@1.0.4
	anyhow@1.0.75
	assert_cmd@2.0.12
	autocfg@1.1.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.4.1
	bstr@1.7.0
	cfg-if@1.0.0
	clap@4.4.6
	clap_builder@4.4.6
	clap_complete@4.4.3
	clap_derive@4.4.2
	clap_lex@0.5.1
	clap_mangen@0.2.14
	colorchoice@1.0.0
	console@0.15.7
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	difflib@0.4.0
	doc-comment@0.3.3
	either@1.9.0
	encode_unicode@0.3.6
	errno@0.3.5
	fastrand@2.0.1
	fnv@1.0.7
	getrandom@0.2.10
	heck@0.4.1
	hermit-abi@0.3.3
	insta@1.34.0
	is-terminal@0.4.9
	itertools@0.11.0
	lazy_static@1.4.0
	libc@0.2.149
	libm@0.2.8
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.10
	memchr@2.6.4
	memmap2@0.9.0
	memoffset@0.9.0
	num-traits@0.2.17
	ppv-lite86@0.2.17
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.0.4
	proc-macro2@1.0.69
	proptest@1.3.1
	quick-error@1.2.3
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xorshift@0.3.0
	rayon-core@1.12.0
	rayon@1.8.0
	redox_syscall@0.3.5
	regex-automata@0.4.3
	regex-syntax@0.7.5
	regex-syntax@0.8.2
	regex@1.10.2
	roff@0.2.1
	rustix@0.38.20
	rusty-fork@0.3.0
	scopeguard@1.2.0
	serde@1.0.189
	serde_derive@1.0.189
	similar@2.3.0
	strsim@0.10.0
	syn@2.0.38
	tempfile@3.8.0
	terminal_size@0.3.0
	termtree@0.4.1
	thiserror-impl@1.0.50
	thiserror@1.0.50
	unarray@0.1.4
	unescape@0.1.0
	unicode-ident@1.0.12
	unicode-width@0.1.11
	utf8parse@0.2.1
	wait-timeout@0.2.0
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	yaml-rust@0.4.5
"

inherit cargo

DESCRIPTION="Intuitive find & replace CLI (sed alternative)"
HOMEPAGE="https://github.com/chmln/sd"
SRC_URI="
	https://github.com/chmln/sd/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64 ~x86"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_prepare() {
	default
	sed -i '/^strip =/d' Cargo.toml || die
}

src_install() {
	cargo_src_install
	dodoc CHANGELOG.md README.md
}
