#include <sys/HAL.h>
#include <sys/compat.h>

#ifdef __i386__
//#include <sys/HAL/x86/gdt.h>
#include <sys/HAL/x86/idt.h>
#include <sys/HAL/x86/ports.h>
#endif

extern void HAL_init() {
	intr_init();
}

extern void HAL_intr_enable() {
#ifdef __i386__
	asm("sti");
#else
	platform_compatibility_error();
#endif
}

extern void HAL_intr_disable() {
#ifdef __i386__
	asm("cli");
#else
	platform_compatibility_error();
#endif
}

extern void HAL_intr_generate(int intr) {
#ifdef __i386__
	asm("movb %0, point+1" :: "r" ((u8)intr));
	asm("point: int $0");
#else
	platform_compatibility_error();
#endif
}

#ifdef __i386__
extern intr_handler HAL_intr_getIR(int intr) {
	return intr_getIR(intr);
}
#endif

#ifdef __i386__
extern void HAL_intr_setIR(int intr, intr_handler ir) {
	intr_setIR(intr, ir);
}
#endif
