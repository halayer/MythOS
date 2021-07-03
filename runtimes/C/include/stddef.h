#ifdef NULL
#  undef NULL
#endif

#ifdef __cplusplus
#  define NULL 0
#else
#  define NULL (void *)0
#endif
