;Canal Os Vilões
;Leonardo Oliveira
;Versão de 32-bit
;nasm -f win32 -o hello2.o hello2.asm
;ld -L [MUDAR_PARA_DIRETORIO_COM_O_KERNEL32.DLL_32BITS] -l kernel32 -m i386pe -o hello2.exe hello2.o

NULL EQU 0
STD_OUT_HANDLE EQU -11

extern _ExitProcess
extern _WriteFile
extern _GetStdHandle

global inicio

section .data
    mensagem db "HELLO WORLD OS VILOES 2",0x0A, 0x0D, 0
    tamanho_mensagem EQU $-mensagem
section .text

inicio:

    push STD_OUT_HANDLE
    call _GetStdHandle
    mov ebx,eax
    sub esp,4

    push NULL
    push NULL
    push tamanho_mensagem
    push mensagem
    push ebx
    call _WriteFile
    sub esp,20

    push NULL
    call _ExitProcess
