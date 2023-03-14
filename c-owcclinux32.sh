#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

# -Wl,option -Wl,symfile=t.sym 
owcc -o mozjpegtran.ow -blinux -s -fo=.oo -Os -fno-stack-check -fsigned-char -march=i386 -Wl,option -Wl,eliminate -W -Wall -Wextra -Wno-n202 -Wno-n303 -Wno-n136 -Wno-n201 jpegtran.c rdswitch.c jcparam.c transupp.c jcext.c jerror.c cdjpeg.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcicc.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jcmarker.c jdhuff.c jdcoefct.c jdphuff.c jdarith.c jcmaster.c jchuff.c jcphuff.c jcarith.c jmemnobs.c jaricom.c jsimd_none.c
rm -f ./*.oo
sstrip mozjpegtran.ow  # Remove symbols.
ls -ld mozjpegtran.ow

: "$0" OK.
