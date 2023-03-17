# pts-mozjpegtran: ports of jpegtran of mozjpeg

pts-mozjpegtran contains source ports of several versions of jpegtran of
mozjpeg to different many different platforms. It also includes
cross-compilation scripts (shell scripts which run the C compiler with the
correct arguments) to be run on Linux i386 and amd64. The goal of
pts-mozjpegtran is to build many versions of jpegtran of mozjpeg from its C
source on Linux, targeting many platforms.

To compile on Linux, install the compiler (e.g. GCC), and then run one of
the shell scripts, for example (without the leading `$`):

```
  $ 4.1.1/c-gcc.sh
```

This creates the executable program file `4.1.1/mozjpegtran.gcc`.

The following versions of jpegtran of mozjpeg are supported, with source
code included:

* 3.0, released on 2014-12-30
* 3.1, released on 2015-05-19
* 3.2, released on 2017-05-01
* 3.3.1, released on 2017-07-10
* 4.0.0, released on 2020-11-13
* 4.0.3, released on 2021-02-25
* 4.1.1, released on 2022-08-15

Target architectures supported:

* i386 (actually, i686)
* amd64
* other architectures with recent a GCC (>= 4.8, 2013-03-22) or Clang

Target operating systems supported:

* Linux
* macOS
* Windows (32-bit i386)
* other architectures with recent a GCC (>= 4.8, 2013-03-22) or Clang

Compilers supported:

* GCC (>= 4.8, 2013-03-22)
* Clang
* Clang within [*zig cc*](https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html)
* OpenWatcom C compiler (via the *owcc* driver)
* TCC (TinyCC)

C libraries (libc) supported:

* glibc on Linux
* the system-default libc macOS
* [xstatic](https://github.com/pts/pts-clang-xstatic/blob/master/README.pts-xstatic.txt) (uClibc) for i386 Linux
* musl with [*zig cc*](https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html), statically linked
* uClibc with TCC (TinyCC), statically linked
* OpenWatcom libc in Linux i386 and Windows i386, statically linked
* MSVCRT.DLL on Windows i386 with MinGW GCC
