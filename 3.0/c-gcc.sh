#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

SRCS_3_0='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c'
gcc -o mozjpegtran.gcc -s -O2 -Wl,--gc-sections -ffunction-sections -fdata-sections -W -Wall -Wno-unused-parameter $SRCS_3_0 -lm
ls -ld mozjpegtran.gcc

: "$0" OK.
