#include <sys/kernel/kccursor.h>
#include <sys/HAL.h>

void double_fault();
void itoa(unsigned, unsigned, char *);

__attribute__((noreturn)) void _start() {
	asm("pop %ebp");
	HAL_intr_disable();
	HAL_init();
	HAL_intr_setIR(8, double_fault);

    KC_setColor(0x17);
    KC_clear();

	KC_moveCursor(10, 10);
    KC_puts("Hello, World!\n");

	HAL_intr_enable();

    stop:
    asm("hlt");
    goto stop;
	asm("cli");
	asm("hlt");
}

unsigned addr = 0;
char buf[9] = "\0\0\0\0\0\0\0\0\0";

__attribute__((noreturn)) void double_fault() {
	INTR_HEAD

	asm("pop addr");
	itoa(addr, 16, &(buf[0]));
	asm("push addr");

	KC_setColor(0x17);
	KC_clear();

	KC_moveCursor(2, 1);
	KC_puts("FATAL ERROR: Double Fault\n\n");
	KC_puts("Unhandled exception at address 0x"); KC_puts(buf);
	KCCursor_hide();

	HAL_intr_disable();

	ret:
	INTR_RET
	goto ret;
}

static char base_chars[] = "0123456789ABCDEF";
static char temp_buf[16];

void itoa(unsigned i, unsigned base, char *buf) {
	int pos = 0;
	int opos = 0;
	int top = 0;

	while (i != 0) {
		temp_buf[pos] = base_chars[i % base];
		pos++;
		i /= base;
	}

	top = pos--;

	for (opos = 0; opos < top; pos--, opos++) {
		buf[opos] = temp_buf[pos];
	}

	buf[opos] = 0;
}

void stack_dump();
