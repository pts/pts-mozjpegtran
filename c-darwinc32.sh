#! /bin/sh --
# by pts@fazekas.hu at Thu Mar  9 01:11:17 CET 2023
set -ex

if type i386-apple-darwin14-gcc >/dev/null 2>&1; then
  PREFIX=  # https://github.com/pts/pts-osxcross
else
  PREFIX="docker run -v --rm -it $PWD:/workdir multiarch/crossbuild /usr/osxcross/bin/"
fi


${PREFIX}i386-apple-darwin14-gcc -o mozjpegtran.darwinc32 -mmacosx-version-min=10.5 -Wl,-dead_strip -ffunction-sections -fdata-sections -lSystem -lcrt1.10.5.o -nostdlib -O2 -W -Wall -Wno-unused-parameter jpegtran.c rdswitch.c jcparam.c transupp.c jcext.c jerror.c cdjpeg.c jdapimin.c jcapimin.c jdatasrc.c jdtrans.c jctrans.c jdatadst.c jcicc.c jcomapi.c jutils.c jdmarker.c jmemmgr.c jdinput.c jcmarker.c jdhuff.c jdcoefct.c jdphuff.c jdarith.c jcmaster.c jchuff.c jcphuff.c jcarith.c jmemnobs.c jaricom.c jsimd_none.c
${PREFIX}i386-apple-darwin14-strip  mozjpegtran.darwinc32

: "$0" OK.
