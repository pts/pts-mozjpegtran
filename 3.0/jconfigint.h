/* libjpeg-turbo build number */
#define BUILD "pts"

/* How to obtain function inlining. */
#ifdef __WATCOMC__
#define INLINE inline
#else
#define INLINE  __inline__
#endif

/* How to obtain thread-local storage */
#define THREAD_LOCAL

/* Define to the full name of this package. */
#define PACKAGE_NAME "mozjpeg"

/* Version number of package */
#define VERSION "3.0"

/* The size of `size_t', as computed by sizeof. */
#ifdef __SIZEOF_POINTER__
#  define SIZEOF_SIZE_T __SIZEOF_POINTER__
#else
#  if defined(__WATCOMC__) && defined(_M_I386)
#    define SIZEOF_SIZE_T 4
#  endif
#endif

/* Define if your compiler has __builtin_ctzl() and sizeof(unsigned long) == sizeof(size_t). */
#if __SIZEOF_LONG__ && __SIZEOF_LONG__ == SIZEOF_SIZE_T
#define HAVE_BUILTIN_CTZL 1
#endif

/* Define to 1 if you have the <intrin.h> header file. */
#undef HAVE_INTRIN_H  /* xstatic uClibc doesn't have it */

#if defined(_MSC_VER) && defined(HAVE_INTRIN_H)
#if (SIZEOF_SIZE_T == 8)
#define HAVE_BITSCANFORWARD64
#elif (SIZEOF_SIZE_T == 4)
#define HAVE_BITSCANFORWARD
#endif
#endif

#if defined(__has_attribute)
#if __has_attribute(fallthrough)
#define FALLTHROUGH  __attribute__((fallthrough));
#else
#define FALLTHROUGH
#endif
#else
#define FALLTHROUGH
#endif
