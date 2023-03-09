#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex

xstatic gcc -o mozjpegtran.xstatic -m32 -march=i686 -s -O2 -W -Wall -Wno-unused-variable -Wno-unused-parameter -Wno-sign-compare -Wl,--gc-sections -ffunction-sections -fdata-sections jpegtran.c rdswitch.c jcparam.c transupp.c jcext.c jerror.c cdjpeg.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcicc.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jcmarker.c jdhuff.c jdcoefct.c jdphuff.c jdarith.c jcmaster.c jchuff.c jcphuff.c jcarith.c jmemnobs.c jaricom.c jsimd_none.c -lm
ls -ld mozjpegtran.xstatic

: "$0" OK.
