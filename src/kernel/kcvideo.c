#include <sys/types.h>
#include <sys/kernel/kcvideo.h>
#include <sys/kernel/kccursor.h>

static char *video = (char *)0xB8000;
static u8 color = 0x07;
static int __disable_updating = 0;
static u8 cursor_x_start;

extern void KC_clear() {
    int i;

    for (i = 0; i < (ROWS * COLS); i++) {
        video[i << 1] = 0x00;
        video[(i << 1) + 1] = color;
    }
}

extern void KC_setColor(u8 clr) {
    color = clr;
}

extern void KC_putc(char chr) {
    KCCursor *cursor = KCCursor_getPtr();

    if (chr == 10) {
        goto newline;
	} else if (chr == 13) {
		cursor->x = 0;
    } else {
        video[(cursor->y * COLS + cursor->x)<<1] = chr;
        video[((cursor->y * COLS + cursor->x)<<1) + 1] = color;
        cursor->x++;

        if (cursor->x == COLS) goto newline;
    }

    goto ret;

    newline:
    cursor->x = cursor_x_start;
    cursor->y++;

    ret:
    if (!__disable_updating) KCCursor_update();
}

extern void KC_puts(char *string) {
    int i;

    __disable_updating = 1;
    for (i = 0; string[i] != 0; i++) {
        KC_putc(string[i]);
    }
    __disable_updating = 0;

    KCCursor_update();
}

extern void KC_moveCursor(u8 x, u8 y) {
	cursor_x_start = x;
	KCCursor_move(x, y);
	KCCursor_update();
}
