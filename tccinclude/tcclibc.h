/*
 * tcclibc.h: libc functions and definitions needed by jpegtran of mozjpeg
 * by pts@fazekas.hu at Fri Mar 17 19:42:44 CET 2023
 */
#ifndef _TCCLIBC_H
#define _TCCLIBC_H

#if !defined(__TINYC__)
#error compiler not supported by <tcclibc.h>, must be TCC (TinyCC)
#endif

#if !defined(__linux__)
#error target operating system not supported by <tcclibc.h>, must be Linux
#endif

#if !(defined(__i386__) || defined(__x86_64__))
#error target architecture not supported by <tcclibc.h>
#endif

#ifdef _WIN32  /* Not properly supported yet. */
#  define __cdecl __attribute__((__cdecl__))
#else
#  define __cdecl
#endif

/* <stdint.h>, <limits.h> etc. */
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef unsigned long size_t;  /* Good for __i386__ (4 bytes) and __amd64__ (8 bytes). */
#define SIZE_MAX ((size_t)-1)  /* Doesn't work in the preprocessor. */
#define INT_MIN ((int)((1U << (sizeof(int) - 1))))
#define INT_MAX ((int)((1U << (sizeof(int) - 1)) - 1U))
#define CHAR_BIT 8
typedef long ssize_t;  /* Good for __i386__ (4 bytes) and __amd64__ (8 bytes). */
typedef long off_t;  /* Good for __i386__ (4 bytes) and __amd64__ (8 bytes). */

/* <stdlib.h> */
#define NULL ((void*)0)
/* <unistd.h> */
int __cdecl remove(const char *pathname);
__attribute__((noreturn)) void __cdecl exit(int status);

/* <string.h> */
size_t __cdecl strlen(const char *s);
char * __cdecl strcpy(char *dest, const char *src);
int __cdecl strcmp(const char *s1, const char *s2);
char * __cdecl strncpy(char *dest, const char *src, size_t n);
void * __cdecl memcpy(void *dest, const void *src, size_t n);
void * __cdecl memset(void *s, int c, size_t n);

/* <ctype.h> */
int __cdecl isalpha(int c);
int __cdecl isspace(int c);
int __cdecl isdigit(int c);
int __cdecl isxdigit(int c);
int __cdecl isupper(int c);
int __cdecl tolower(int c);

/* <unistd.h> etc. */
ssize_t __cdecl read(int fd, void *buf, size_t count);  /* Win32 uses int instead of size_t etc. */
ssize_t __cdecl write(int fd, const void *buf, size_t count);  /* Win32 uses int instead of size_t etc. */
#define SEEK_SET 0  /* whence value below. */
#define SEEK_CUR 1
#define SEEK_END 2
off_t __cdecl lseek(int fd, off_t offset, int whence);  /* Just 32-bit off_t. */
#define O_RDONLY 0  /* flags bitfield value below. */
#define O_WRONLY 1
#define O_RDWR 2
int __cdecl open(const char *pathname, int flags, ...);  /* int mode */
int __cdecl creat(const char *pathname, int mode);
int __cdecl close(int fd);
#ifdef _WIN32
#  define O_CREAT 0x100
#  define O_TRUNC 0x200
#  define O_BINARY 0x8000
#  define creat(filename, mode) open(filename, O_CREAT | O_TRUNC | O_WRONLY | O_BINARY, 0)  /* 0 to prevent Wine warning: fixme:msvcrt:MSVCRT__wsopen_s : pmode 0x406b9b ignored.  */
int __cdecl setmode(int _FileHandle,int _Mode);
#endif

/* <stdio.h> */
#ifndef EOF
#  define EOF (-1)
#endif
typedef struct _FILE *FILE;
extern FILE *stdin, *stdout, *stderr;
int __cdecl fprintf(FILE *stream, const char *format, ...);
int __cdecl sprintf(char *str, const char *format, ...);
int __cdecl snprintf(char *str, size_t size, const char *format, ...);
int __cdecl sscanf(const char *str, const char *format, ...);
FILE * __cdecl fopen(const char *pathname, const char *mode);
int __cdecl fseek(FILE *stream, long offset, int whence);  /* TODO(pts): What if _FILE_OFFSET_BITS == 64? */
long __cdecl ftell(FILE *stream);  /* TODO(pts): What if _FILE_OFFSET_BITS == 64? */
int __cdecl fclose(FILE *stream);
size_t __cdecl fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
int __cdecl ferror(FILE *stream);
size_t __cdecl fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);
int __cdecl getc(FILE *stream);
int __cdecl ungetc(int c, FILE *stream);
int __cdecl fflush(FILE *stream);

/* <stdlib.h> */
void * __cdecl malloc(size_t size);
void __cdecl free(void *ptr);
void * __cdecl realloc(void *ptr, size_t size);

/* <stdlib.h> */
char __cdecl *getenv(const char *name);

/* <errno.h> */
extern int errno;
#define EINVAL 22 /* Invalid argument */
#define ERANGE 34 /* Math result not representable */

/* <math.h> */
double __cdecl log(double x);

#endif
