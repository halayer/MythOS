; ==================
; FILE: bootutil.asm
; ==================
;
; Routines both stage bootloaders use.


; =============
; ROUTINE: halt
; =============
;
; Brings the CPU to a complete stop.
halt:
    cli
.inf:
    hlt

    jmp .inf


; =====================
; ROUTINE: print_string
; =====================
;
; Print a string with the help of BIOS teletype output.
;
; PARAMETERS:
;     in:  SI = Pointer to a null-terminated string
print_string:
    pusha   ; Save registers

    cld
    mov ax, 0xb800
    mov es, ax
    xor di, di
    mov ah, 15
.loop:
    mov al, [ds:si] ; Load next byte into al
    stosw
    inc si
    cmp al, 0x00    ; Check if it is a null byte
    jne .loop       ; Repeat
.ret:
    popa    ; Restore registers

    ret
