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

    mov ah, 0x0E    ; Teletype output
    mov bh, 0x00    ; Page 0
.loop:
    lodsb           ; Load next byte into al
    cmp al, 0x00    ; Check if it is a null byte
    jz .ret         ; If so, exit loop
    int 0x10        ; If not, print it
    jmp .loop       ; Repeat
.ret:
    popa    ; Restore registers

    ret
