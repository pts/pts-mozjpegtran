#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

NOPIE=""  # GCC 4.8.4 doesn't have `-no-pie'.
gcc -no-pie -E - </dev/null >/dev/null 2>&1 && NOPIE="-no-pie"

gcc -o mozjpegtran.gcc32 -m32 -march=i686 $NOPIE -s -O2 -Wl,--gc-sections -ffunction-sections -fdata-sections -W -Wall -Wno-unused-parameter jpegtran.c rdswitch.c jcparam.c transupp.c jcext.c jerror.c cdjpeg.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcicc.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jcmarker.c jdhuff.c jdcoefct.c jdphuff.c jdarith.c jcmaster.c jchuff.c jcphuff.c jcarith.c jmemnobs.c jaricom.c jsimd_none.c -lm
ls -ld mozjpegtran.gcc32

: "$0" OK.
