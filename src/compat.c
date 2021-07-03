#include <sys/compat.h>
#include <sys/kernel/kcvideo.h>

void platform_compatibility_error() {
	KC_puts("Not supported on this platform.\n");
}
