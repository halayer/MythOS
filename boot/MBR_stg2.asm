; ==================
; FILE: MBR_stg2.asm
; ==================
;
; The second stage of the bootloader, residing in a partition of a drive.
;
; Loads the file "entry" from the partition, and jumps into it.


include "BPB.inc"

use16
org 0x7E3E
    
    ; Save the "parameters" passed by stage 1
    mov [drive_num], dl             ; Drive number
    mov [partition_num], dh         ; Partition number
    mov [LBA], ax                   ; LBA of the start sector of this partition
    mov [LBA+2], bx
    mov [sectors_per_track], cl     ; Sectors per track
    mov [heads_per_cylinder], ch    ; Heads per cylinder

    xor ax, ax
    xor bx, bx
    xor cx, cx

    ; Determine the size of the root directory in sectors
    mov ax, 0x20                    ; 32 bytes per entry
    mul WORD [BPB_ROOT_ENTRIES]     ; multiply by number of entries = size in bytes
    div WORD [BPB_BYTES_PER_SECTOR] ; divide by the bytes per sector = size in sectors
    xchg bx, ax

    ; Determine the LBA for the root directory of this partition
    mov al, [BPB_NUMBER_OF_FATS]
    mul WORD [BPB_SECTORS_PER_FAT]
    add ax, [BPB_RESERVED_SECTORS]
    add ax, [LBA]

    push ax
    call LBA_to_CHS ; Convert it to CHS
    pop ax

    add ax, bx                  ; root directory + size of root directory
    mov [first_data_sector], ax ; = first data sector

    ; Read the root directory into 0x0:0x8000
    mov ah, 0x02        ; INT 13h AH=02h: Read Sectors From Drive
    mov al, bl          ; AL = # of sectors to read = size of root directory
    mov dl, [drive_num] ; DL = Drive
    mov bx, 0x8000      ; ES:BX = Buffer Address Pointer = 0x0:0x8000
.retry:
    int 0x13    ; BIOS interrupt INT 13h
    jc .retry

    ; Browse the root directory for the file "ENTRY"
    mov cx, [BPB_ROOT_ENTRIES]  ; # of entries
    mov di, 0x8000              ; Address of the root directory
.loop:
    push cx
    mov cx, 11                  ; Name is eleven characters long
    mov si, filename            ; Compare to "ENTRY      "
    push di
    rep cmpsb                   ; Do the strings match?
    pop di
    je load_file                ; If so, load the file
    pop cx
    add di, 0x20                ; Otherwise, parse the next entry
    loop .loop
    jmp entry_not_found

; Load the file
load_file:
    ; Determine the file size in sectors
    mov ax, [di+0x1C]               ; File size (in bytes)
    div WORD [BPB_BYTES_PER_SECTOR] ;   / bytes per sector
    xchg cx, ax                     ;   = File size (in sectors)

    mov ax, [di+0x1A]                   ; Pop the first cluster
    sub ax, 2                           ; LBA = (cluster-2)
    mul BYTE [BPB_SECTORS_PER_CLUSTER]  ;  * sectors per cluster
    xor ah, ah
    add ax, WORD [first_data_sector]    ;  + LBA of first datasector
    call LBA_to_CHS                     ; Convert it to CHS

    ; Load the file at 0x1000:0x0
    mov ah, 0x02        ; INT 13h AH=02h: Read Sectors From Drive
    mov al, cl          ; AL = # of sectors to read = # of sectors the file occupies
    mov dl, [drive_num] ; DL = Drive
    xor bx, bx          ; ES:BX = Buffer Address Pointer = 0x0:0x8000
    mov es, bx
    mov bx, 0x8000
.retry:
    int 0x13    ; BIOS interrupt INT 13h
    jc .retry

    ; Pass some "parameters"
    mov dh, [partition_num]         ; Partition & drive number
    mov dl, [drive_num]
    mov ax, [LBA]                   ; LBA of the partition's first sector
    mov bx, [LBA+2]
    mov cl, [sectors_per_track]     ; Sectors per track
    mov ch, [heads_per_cylinder]    ; Heads per cylinder

    push bx

    xor bx, bx  ; Set segment registers accordingly
    mov ds, bx
    mov ss, bx
    mov es, bx
    mov fs, bx
    mov gs, bx

    pop bx

    jmp 0x0:0x8000

    jmp halt

; Print out error message, if the entry file wasn't found
entry_not_found:
    mov si, entry_file_not_found
    call print_string

    jmp halt

LBA_to_CHS:
    xor dx, dx
    div WORD [sectors_per_track]    ; LBA / Sectors per track
    mov cl, dl                      ; Sector = (LBA % Sectors per track) + 1
    inc cl                          ; Since the first sector is sector 1
    xor dx, dx
    div WORD [heads_per_cylinder]   ; LBA / Sectors per track / Heads per cylinder
    mov dh, dl                      ; Head = (LBA / Sectors per track) % Heads per cylinder
    mov ch, al                      ; Cylinder = (LBA / Sectors per track) / Heads per cylinder
    shl ah, 6                       ; Store the upper 2 bits of the 10 bit cylinder
    or cl, ah                       ;   in the upper 2 bits of the sector

    ret


include "bootutil.inc"


drive_num:          db 0
partition_num:      db 0
LBA:                dd 0
sectors_per_track:  dw 0
heads_per_cylinder: dw 0
first_data_sector:  dw 0

entry_file_not_found: db "Can't find file 'entry' on partition", 0
filename: db "ENTRY      "
