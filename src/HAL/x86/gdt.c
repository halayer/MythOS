#include <types.h>
#include <HAL/x86/gdt.h>

typedef struct GDT_Ptr {
    u16 size;
    u32 addr;
} GDT_Ptr;

static struct GDT_Desc GDT[GDT_MAX_DESCRIPTORS];
static struct GDT_Ptr  gdtr;

extern void GDT_install() {
    asm("lgdt (%0)" : : "p" (&gdtr));
}

extern void GDT_setDescriptor(int index, u32 base, u32 limit, u8 access, u8 grand) {
    if (index > GDT_MAX_DESCRIPTORS - 1)
        return;

    GDT[index].base_lo = base & 0xFFFF;
    GDT[index].base_mid = (base >> 16) & 0xFF;
    GDT[index].base_hi = (base >> 24) & 0xFF;
    GDT[index].limit = limit & 0xFFFF;

    GDT[index].flags = access;
    GDT[index].grand = (limit >> 16) & 0x0F;
    GDT[index].grand |= grand & 0xF0;
}

extern struct GDT_Desc *GDT_getDescriptor(int index) {
    if (index > GDT_MAX_DESCRIPTORS - 1)
        return 0;

    return &GDT[index];
}
