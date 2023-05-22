.intel_syntax noprefix


# Walks the callstack recursively, and fills in
# each functions Instruction Pointer to func_ip.
# Returns the number of frames traversed.
#
# char Bugcheck_Stacktrace(void *func_ip[16]);
#
# return value is returned in al.
.global Bugcheck_backtrace
# TODO: Do not rely on stack frames!
Bugcheck_backtrace:
    pop eax

    mov ecx, ebp     # Set ecx up to be the base pointer
    mov edx, esp     # Set edx up to be the stack pointer

.loop:
    mov edx, ecx        # MOV rsp, rbp
    mov ecx, [edx]      # POP rbp
    push ecx
    mov ecx, [edx+4]    # POP ecx   (Return Address)
    add edx, 4
    mov [eax+rax*4], ecx
    
    test ecx, ecx
    pop ecx
    jz .finish      # Escape when Return Address = 0
    cmp al, 15      # Escape when al = 15 (Maximum Buffer Length)
    je .finish
    
    inc al
    jmp .loop

.finish:
    ret
