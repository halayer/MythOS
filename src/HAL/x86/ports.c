#include <types.h>
#include <HAL/x86/ports.h>

extern u8 inb(u16 port) {
    u8 ret;

    asm volatile ("inb %w1, %0":"=a" (ret):"Nd" (port));

    return ret;
}

extern void outb(u16 port, u8 data) {
    asm volatile ("outb %b0, %w1" : : "a" (data), "Nd" (port));
}
