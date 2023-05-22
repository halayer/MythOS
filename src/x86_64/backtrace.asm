.intel_syntax noprefix


# Walks the callstack recursively, and fills in
# each functions Instruction Pointer to func_ip.
# Returns the number of frames traversed.
#
# char Bugcheck_Stacktrace(void *func_ip[16]);
#
# void *func_ip[16] is expected in rdi.
# return value is returned in al.
.global Bugcheck_backtrace
# TODO: Do not rely on stack frames!
Bugcheck_backtrace:
    mov r8, rbp     # Set r8 up to be the base pointer
    mov r9, rsp     # Set r9 up to be the stack pointer

.loop:
    mov r9, r8          # MOV rsp, rbp
    mov r8, [r9]        # POP rbp
    mov rcx, [r9+8]     # POP rax   (Return Address)
    add r9, 16
    mov [rdi+rax*8], rcx
    
    test rcx, rcx
    jz .finish      # Escape when Return Address = 0
    cmp al, 15      # Escape when al = 15 (Maximum Buffer Length)
    je .finish
    
    inc al
    jmp .loop

.finish:
    ret
