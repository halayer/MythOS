#ifndef _GDT_H_
#define _GDT_H_

#include <types.h>

#define GDT_MAX_DESCRIPTORS 65536

typedef struct GDT_Desc {
    u16 limit;
    u16 base_lo;
    u8 base_mid;
    u8 flags;
    u8 grand;
    u8 base_hi;
} GDT_Desc;

extern void GDT_install();
extern void GDT_setDescriptor(int index, u32 base, u32 limit, u8 access, u8 grand);
extern struct GDT_Desc *GDT_getDescriptor(int index);

#endif
