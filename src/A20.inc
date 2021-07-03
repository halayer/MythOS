; =============
; FILE: A20.inc
; =============
;
; Implements a variety of methods for enabling A20, and abstract them
; in one procedure: A20_enable

A20_enable:
    ; Algorithmus:
    ; |- Mithilfe von INT 15h AX=2041h A20 aktivieren
    ; |  +- Befehl unterstützt? Wenn nicht, fortfahren
    ; |- A20-Unterstützung abfragen:
    ; |  |- Keyboard controller unterstützt A20? --> .keybd
    ; |  +- Port 0x92 unterstützt A20? --> .port
    call .BIOS  ; Enable A20 via BIOS interrupt
    jnc .done
.query:
    mov ax, 0x2403  ; INT 15h AX=2403h: Query A20 Support
    int 0x15        ; BIOS Interrupt INT 15h
    jc .try         ; If function isn't supported, try methods out

    test bx, 0x1    ; Is enabling A20 through the keyboard controller supported?
    jnz .keybd
    test bx, 0x2    ; Is enabling A20 through I/O port 0x92 supported?
    jnz .port
    
    ret ; Failed to enable A20

.try:
    call .keybd
    call .port
    ret

.BIOS:
    mov ax, 0x2401  ; INT 15h AX=2401h: Enable A20
    int 0x15        ; BIOS Interrupt INT 15h

    ret

.keybd:
    mov al, 0xDD    ; Command 0xDD: Enable A20
    out 0x64, al    ; Send to keyboard controller

    ret

.port:
    ; Read output port command
    mov al, 0xD0
    out 0x64, al
    call .wait_output

    ; Read data from output port
    in al, 0x60
    push ax
    call .wait_input

    ; Write output port command
    mov al, 0xD1
    out 0x64, al
    call .wait_output

    ; Write data to output port
    pop ax
    or al, 2
    out 0x60, al

    ret

.wait_output:
    in al, 0x64         ; Read status register
    test al, 1          ; Test bit 0 (output buffer status)
    jnz .wait_output    ; If set, continue waiting

    ret

.wait_input:
    in al, 0x64     ; Read status register
    test al, 2      ; Test bit 1 (input buffer status)
    jnz .wait_input ; If set, continue waiting

    ret

.done:
    ret
