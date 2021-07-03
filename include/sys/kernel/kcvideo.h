#ifndef _KCVIDEO_H_
#define _KCVIDEO_H_

#include <sys/types.h>

#define ROWS 25
#define COLS 80

extern void KC_clear();
extern void KC_setColor(u8 clr);
extern void KC_putc(char chr);
extern void KC_puts(char *string);
extern void KC_moveCursor(u8 x, u8 y);

#endif
