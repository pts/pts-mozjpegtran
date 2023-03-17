#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

if type pts-tcc >/dev/null 2>&1; then
  TCC=pts-tcc
  TCCLM=
elif type i386-tcc >/dev/null 2>&1; then
  TCC=i386-tcc
  TCCLM=-lm
else
  TCC=tcc
  TCCLM=-lm
fi

SRCS_4_0_3='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c jcicc.c jsimd_none.c'
$TCC -I../tccinclude -o mozjpegtran.tcclinux32 -s -O2 -W -Wall -Wno-unused-parameter $SRCS_4_0_3 $TCCLM

: "$0" OK.
