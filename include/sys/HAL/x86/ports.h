#ifndef _PORTS_H_
#define _PORTS_H_

#include <sys/types.h>

extern u8 inb(u16 port);

extern void outb(u16 port, u8 data);

#endif
