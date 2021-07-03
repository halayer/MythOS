#include <sys/types.h>
#include <sys/kernel/kccursor.h>

static KCCursor kccursor;

extern void KCCursor_update() {
    if (!kccursor.hidden) {
        u16 location = kccursor.y * COLS + kccursor.x;

        outb(0x3D4, 0xF);   // CRT index register = Cursor location low byte
        outb(0x3D5, location & 0xFF);   // Write it to the data register
        outb(0x3D4, 0xE);   // CRT index register = Cursor location high byte
        outb(0x3D5, location >> 8); // Write it to the data register
    }
}

extern void KCCursor_move(u8 x, u8 y) {
    kccursor.x = x;
    kccursor.y = y;

    KCCursor_update();
}

extern void KCCursor_show() {
    kccursor.hidden = 0;
}

extern void KCCursor_hide() {
    kccursor.y += ROWS;    // Move the cursor off the screen
    KCCursor_update();
    kccursor.y -= ROWS;    // Restore old cursor position
    kccursor.hidden = 1;
}

extern KCCursor *KCCursor_getPtr() {
    return &kccursor;
}
