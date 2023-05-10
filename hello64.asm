;Canal Os Vilões
;Leonardo Oliveira
;Hello World no Windows em 64bits
;nasm -f win64 -o hello64.o hello64.asm
;ld -L C:\Windows\System32 -l kernel32 -o hello64.exe hello64.o
;
NULL EQU 0
STD_OUT_HANDLE EQU -11

extern ExitProcess
extern GetStdHandle
extern WriteFile

global inicio

section .data
    mensagem db "HELLO WORLD OS VILOES 2", 0x0A,0x0D,0
    tamanho_mensagem EQU $-mensagem

section .text

inicio:

    mov rcx, STD_OUT_HANDLE
    call GetStdHandle
    
    mov rcx,rax
    mov rdx,mensagem
    mov r8,tamanho_mensagem
    mov r9,0
    ;mov r9,[rsp-16]
    ;mov qword[rsp-56], 0
    call WriteFile
    ;add rsp,48

    mov rax,NULL
    call ExitProcess
