/* libjpeg-turbo build number */
#define BUILD "pts"

/* How to obtain function inlining. */
#define INLINE __inline__

/* Define to the full name of this package. */
#define PACKAGE_NAME "mozjpeg"

/* Version number of package */
#define VERSION "3.1"

#if defined(__has_attribute)
#if __has_attribute(fallthrough)
#define FALLTHROUGH  __attribute__((fallthrough));
#else
#define FALLTHROUGH
#endif
#else
#define FALLTHROUGH
#endif
