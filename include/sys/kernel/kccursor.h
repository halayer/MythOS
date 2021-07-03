#ifndef _KCCURSOR_H_
#define _KCCURSOR_H_

#include <sys/types.h>
#include <sys/kernel/kcvideo.h>
#include <sys/HAL/x86/ports.h>

typedef struct KCCursor {
    u8 x;
    u8 y;
    u8 hidden;
} KCCursor;

extern void KCCursor_update();
extern void KCCursor_move(u8 x, u8 y);
extern void KCCursor_show();
extern void KCCursor_hide();
extern KCCursor *KCCursor_getPtr();

#endif
