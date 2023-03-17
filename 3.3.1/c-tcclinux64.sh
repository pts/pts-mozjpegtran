#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

if type pts-tcc64 >/dev/null 2>&1; then
  TCC=pts-tcc64
else
  TCC=x86_64-tcc
fi

SRCS_3_3_1='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c jsimd_none.c'
$TCC -I../tccinclude -o mozjpegtran.tcclinux64 -s -O2 -W -Wall -Wno-unused-parameter $SRCS_3_3_1 -lm

: "$0" OK.
