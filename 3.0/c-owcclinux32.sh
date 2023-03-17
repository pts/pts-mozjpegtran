#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

SRCS_3_0='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c'
# -Wl,option -Wl,symfile=t.sym 
owcc -o mozjpegtran.ow -blinux -s -fo=.oo -Os -fno-stack-check -fsigned-char -march=i386 -Wl,option -Wl,eliminate -W -Wall -Wextra -Wno-n202 -Wno-n303 -Wno-n136 -Wno-n201 $SRCS_3_0
rm -f ./*.oo
sstrip mozjpegtran.ow  # Remove symbols.
ls -ld mozjpegtran.ow

: "$0" OK.
