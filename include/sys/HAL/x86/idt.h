#ifndef _IDT_H_
#define _IDT_H_

#include <sys/types.h>
#include <sys/HAL.h>

#define IDT_DESC_16BIT		0x06
#define IDT_DESC_32BIT		0x0E
#define IDT_DESC_RING1		0x40
#define IDT_DESC_RING2		0x20
#define IDT_DESC_RING3		0x60
#define IDT_DESC_PRESENT	0x80

#define MAX_INTERRUPTS 256

typedef struct IDT_Desc {
    u16 ir_lo;
    u16 segment;
    u8 reserved;
    u8 flags;
    u16 ir_hi;
} IDT_Desc;

typedef struct IDT_Ptr {
    uint16_t d[3];
} IDT_Ptr;

extern void intr_init();
extern void intr_setIR(int index, intr_handler ir);
extern intr_handler intr_getIR(int index);

#endif
