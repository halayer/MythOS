; ==================
; FILE: FAT_mini.inc
; ==================
;
; A mini driver for FAT file systems, used by the "entry" file.
; https://wiki.osdev.org/FAT


include "bootutil.inc"


FAT             equ 0x8000
root_directory  equ 0x8200

FAT12 equ 0x00
FAT16 equ 0x01
FAT32 equ 0x02


; ======================
; ROUTINE: FAT_mini_init
; ======================
;
; Initialize the FAT mini driver.
FAT_mini_init:
    pusha

    ; Determine the number of data sectors
    mov ax, [BPB_TOTAL_SECTORS]
    cmp ax, 0x00
    jne .FAT32_total_sectors_continue
.FAT32_total_sectors:
    mov eax, [BPB_TOTAL_SECTORS_BIG]
    mov BYTE [FAT_type], FAT32
.FAT32_total_sectors_continue:
    mov [total_sectors], eax

    ; Determine the size of the FAT
    mov ax, [BPB_SECTORS_PER_FAT]
    cmp ax, 0x00
    jne .FAT32_size_continue
.FAT32_size:
    mov eax, [BPB32_SECTORS_PER_FAT]
.FAT32_size_continue:
    mov [FAT_size], eax

    ; Calculate the first sector of the FAT
    mov eax, [LBA]
    add ax, [BPB_RESERVED_SECTORS]
    mov [first_FAT_sector], eax

    ; Calculate the first data sector
    mov al, [BPB_NUMBER_OF_FATS]    ; # of FATS
    mul DWORD [FAT_size]            ;   * size per FAT
    add ax, [BPB_RESERVED_SECTORS]  ;   + reserved sectors
    add ax, [root_dir_size]         ;   + size of root directory
    add eax, [LBA]                  ;   + LBA of partition
    mov [first_data_sector], eax    ;   = first data sector

    ; Calculate the total number of data sectors
    mov eax, [total_sectors]        ; total # of sectors
    sub eax, [first_data_sector]    ;   - first data sector
    mov [data_sectors], eax         ;   = total # of sectors

    ; Calculate the total number of clusters
    mov eax, [data_sectors]             ; total # of data sectors
    mov ebx, [BPB_SECTORS_PER_CLUSTER]  ;   / sectors per cluster
    and ebx, 0xFF
    div ebx
    mov [total_clusters], eax           ;   = total # of clusters

    ; Calculate the size of the root directory
    mov ax, 0x20                    ; 32 bytes per entry
    mul WORD [BPB_ROOT_ENTRIES]     ; multiply by number of entries = size in bytes
    div WORD [BPB_BYTES_PER_SECTOR] ; divide by the bytes per sector = size in sectors
    mov [root_dir_size], ax

    ; Calculate the first sector of the root directory
    mov eax, [FAT_size]
    mul WORD [BPB_NUMBER_OF_FATS]
    add eax, [first_FAT_sector]
    mov [first_root_dir_sector], eax

    popa

    ret


; ====================
; ROUTINE: search_file
; ====================
;
; Find a file in the root directory.
;
; PARAMETERS:
;     in:  SI = Address of the filename string
;     out: AX = Root directory entry address
search_file:
    ; Load the root directory at 0x0:0x9000
    xor ax, ax
    mov es, ax

    mov eax, [first_root_dir_sector]
    mov cl, [root_dir_size]
    mov bx, 0x9000
    call read_sectors

    ; Browse for the file
    mov cx, [BPB_ROOT_ENTRIES]  ; # of entries
    mov di, 0x9000              ; Address of the root directory

.next_entry:
    push cx     ; Save the counter containing the number of root entries

    mov cx, 11      ; Length of the filename
    call strcmp     ; Compare it to the filename of the root directory entry
    pop cx          ; Restore the counter
    je .return      ; If the filenames match, break out of the loop

    dec cx              ; Decrease the counter
    jz .file_not_found  ; If the counter is 0, the file couldn't be found
    add di, 0x20        ; Point to the next root directory entry
    jmp .next_entry     ; Repeat
.return:
    mov ax, di

    ret
.file_not_found:
    mov si, file_not_found
    call print_string

    jmp halt


; ===============
; ROUTINE: strcmp
; ===============
;
; Compare two strings.
;
; PARAMETERS:
;     in:  SI = String to compare to
;     in:  DI = String to be compared
;     in:  CX = String length in bytes
;     out: ZF = Strings equal one another
strcmp:
    pusha   ; Save register values

.loop:
    mov al, [di]    ; Fetch byte
    cmp al, [si]    ; Compare to the string
    jne .done       ; If not equal, return
    inc di          ; Point to next byte
    inc si
    dec cx          ; Reduce the counter by 1
    jz .done        ; If the counter is zero, return (strings are equal)
    jmp .loop       ; Repeat
.done:
    popa    ; Restore register values

    ret ; Return


; =====================
; ROUTINE: read_sectors
; =====================
;
; Read sectors into a specified address.
;
; PARAMETERS:
;     in:  AX = LBA of the first sector to read
;     in:  CL = Number of sectors to read
;     in:  ES:BX = Buffer to read the sectors into
read_sectors:
    push dx
    push cx

    ; Convert LBA in AX to CHS
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

    mov dl, [drive_num]
    pop ax
.retry:
    mov ah, 0x02    ; INT 13h AH=02h: Read Sectors From Drive
    int 0x13        ; BIOS interrupt INT 13h
    jc .retry

    pop dx

    ret


; ==================
; ROUTINE: read_file
; ==================
;
; Reads a file previously identified by search_file.
;
; PARAMETERS:
;     in:  AX = Root directory entry address
;     in:  BX = Address to load the file at
;     out: CX = File size in bytes
read_file:
    mov eax, [di+28]
    div WORD [BPB_BYTES_PER_SECTOR]
    mov cl, al
    inc cl

    mov ax, [di+26]
    sub ax, 2
    mul BYTE [BPB_SECTORS_PER_CLUSTER]
    add ax, [first_data_sector]
    add ax, [LBA]
    
    call read_sectors

    ret

success: db "SUCCESS!", 0xA, 0xD, 0x0
file_not_found: db "FILE NOT FOUND", 0xA, 0xD, 0x0


total_sectors:  dd 0
total_clusters: dd 0

first_FAT_sector: dd 0
FAT_size:         dd 0
FAT_type:         db 0

root_dir_size:          dw 0
first_root_dir_sector:  dd 0

first_data_sector:  dd 0
data_sectors:       dd 0
