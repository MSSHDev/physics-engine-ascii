@echo off
cls
nasm -f win32 normal.asm -o normal.obj
gcc -m32 normal.obj -o normal.exe
normal.exe %1