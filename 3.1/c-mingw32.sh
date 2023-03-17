#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

SRCS_3_1='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c'
i686-w64-mingw32-gcc -o mozjpegtran.exe -m32 -mconsole -march=i686 -s -O2 -W -Wall -Wno-unused-parameter -Wl,--gc-sections -ffunction-sections -fdata-sections $SRCS_3_1
ls -ld mozjpegtran.exe

: "$0" OK.
