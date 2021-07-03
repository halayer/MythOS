#ifndef _HAL_H_
#define _HAL_H_

typedef void (*intr_handler)();

#ifdef __i386__
#define MAX_INTERRUPTS 256

#define INTR_HEAD asm("add $0x4, %esp"); asm("leave");
#define INTR_RET asm("iret");
#endif

extern void HAL_init();
extern void HAL_intr_enable();
extern void HAL_intr_disable();
extern void HAL_intr_generate(int intr);
extern intr_handler HAL_intr_getIR(int intr);
extern void HAL_intr_setIR(int intr, intr_handler ir);

#endif
