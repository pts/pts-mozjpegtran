#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

owcc -o mozjpegtran.ow.exe -bwin32 -fo=.oo -s -Os -fno-stack-check -fsigned-char -march=i386 -Wl,option -Wl,eliminate -Wl,runtime -Wl,console=3.10 -W -Wall -Wextra -Wno-n202 -Wno-n303 -Wno-n136 -Wno-n201 jpegtran.c rdswitch.c jcparam.c transupp.c jcext.c jerror.c cdjpeg.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcicc.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jcmarker.c jdhuff.c jdcoefct.c jdphuff.c jdarith.c jcmaster.c jchuff.c jcphuff.c jcarith.c jmemnobs.c jaricom.c jsimd_none.c nouser32.c
rm -f ./*.oo
ls -ld mozjpegtran.ow.exe

: "$0" OK.
