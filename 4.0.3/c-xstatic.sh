#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

SRCS_4_0_3='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c jcicc.c jsimd_none.c'
xstatic gcc -o mozjpegtran.xstatic -m32 -march=i686 -s -O2 -W -Wall -Wno-unused-parameter -Wl,--gc-sections -ffunction-sections -fdata-sections $SRCS_4_0_3 -lm
ls -ld mozjpegtran.xstatic

: "$0" OK.
