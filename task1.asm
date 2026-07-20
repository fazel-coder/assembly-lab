; task1.asm
; Objective: Generate a sequence of even numbers from 2 to 20
; Demonstrates conditional instructions (cmp / jg / jnz) to control looping

section .bss
    numStr resb 8          ; buffer to hold ASCII representation of a number

section .text
    global _start

_start:
    mov r12, 2              ; r12 = current number, start at 2 (loop counter)

print_loop:
    cmp r12, 20             ; compare current number to 20
    jg  done                ; if current > 20, exit loop

    ; ---- convert r12 (integer) to ASCII string in numStr ----
    mov rax, r12            ; copy number into rax for division
    mov rbx, 10              ; divisor for decimal conversion
    lea rdi, [numStr+7]        ; point to END of buffer (build string backwards)
    mov byte [rdi], 10           ; store newline at the very end first
    xor rsi, rsi                  ; rsi = digit counter

convert:
    dec rdi                  ; move pointer left (make room for next digit)
    xor rdx, rdx                ; clear rdx before divide
    div rbx                       ; rax = rax/10, rdx = rax%10
    add rdx, '0'                    ; convert remainder to ASCII digit
    mov [rdi], dl                     ; store digit into buffer
    inc rsi                             ; count digit stored
    test rax, rax                        ; is quotient zero?
    jnz convert                            ; if not zero, keep dividing

    ; rdi now points to the start of the number string
    mov rdx, rsi
    inc rdx                    ; rdx = total length to print (digits + newline)

    ; ---- print the number using syscall write ----
    mov rax, 1                ; sys_write syscall number (x86-64)
    mov rsi, rdi                 ; rsi = pointer to string start
    mov rdi, 1                     ; rdi = file descriptor 1 (stdout)
    syscall                           ; make the system call

    add r12, 2                 ; move to next even number
    jmp print_loop                ; repeat loop

done:
    mov rax, 60               ; syscall number for exit
    xor rdi, rdi                ; exit code 0
    syscall