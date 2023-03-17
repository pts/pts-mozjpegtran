#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

SRCS_3_3_1='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c jsimd_none.c'
# `zig cc' already does link-time optimizetion, e.g. removal of unused global functions.
# Works with https://ziglang.org/download/0.10.1/zig-linux-x86_64-0.10.1.tar.xz
zig cc -target x86_64-linux-musl -o mozjpegtran.zig64 -s -O2 -W -Wall -Wno-unused-parameter $SRCS_3_3_1 -lm

: "$0" OK.
