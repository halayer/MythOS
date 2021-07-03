#include <sys/types.h>
#include <sys/HAL/x86/idt.h>
#include <sys/HAL.h>

/*typedef struct IDT_Ptr {
    u16 size;
    u32 addr;
} IDT_Ptr;*/

struct IDT_Desc IDT[MAX_INTERRUPTS];
struct IDT_Ptr  idtr;

extern void intr_init() {
	u32 addr = (u32)&IDT;
	idtr.d[0] = MAX_INTERRUPTS;
	idtr.d[1] = addr & 0xFFFF;
	idtr.d[2] = (addr >> 16) & 0xFFFF;

	asm("lidt (%0)" : : "p" (&idtr));
}

extern void intr_setIR(int index, intr_handler ir) {
    if (index > MAX_INTERRUPTS - 1)
        return;

    IDT[index].ir_lo = (u32)ir & 0xFFFF;
    IDT[index].ir_hi = ((u32)ir >> 16) & 0xFFFF;
    IDT[index].reserved = 0;
    IDT[index].flags = 0x80 | 0x0E;	// IDT_DESC_PRESENT | IDT_DESC_32BIT
    IDT[index].segment = 0x08;		// Code segment
}

extern intr_handler intr_getIR(int index) {
	if (index > MAX_INTERRUPTS - 1)
		return (intr_handler)0;

	return (intr_handler)(IDT[index].ir_lo | (IDT[index].ir_hi << 16));
}
