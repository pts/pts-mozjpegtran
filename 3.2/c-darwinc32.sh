#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex
cd "${0%/*}"

if type i386-apple-darwin14-gcc >/dev/null 2>&1; then
  PREFIX=  # https://github.com/pts/pts-osxcross
else
  PREFIX="docker run -v --rm -it $PWD:/workdir multiarch/crossbuild /usr/osxcross/bin/"
fi

SRCS_3_2='jpegtran.c rdswitch.c cdjpeg.c jcparam.c transupp.c jcext.c jerror.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jdphuff.c jdcoefct.c jdarith.c jdhuff.c jcmaster.c jchuff.c jcmarker.c jcphuff.c jmemnobs.c jcarith.c jaricom.c jsimd_none.c'
${PREFIX}i386-apple-darwin14-gcc -o mozjpegtran.darwinc32 -mmacosx-version-min=10.5 -Wl,-dead_strip -ffunction-sections -fdata-sections -lSystem -lcrt1.10.5.o -nostdlib -O2 -W -Wall -Wno-unused-parameter $SRCS_3_2
${PREFIX}i386-apple-darwin14-strip  mozjpegtran.darwinc32

: "$0" OK.
