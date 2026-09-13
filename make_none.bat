@echo off
cls
nasm -f win32 none.asm -o none.obj
gcc -m32 none.obj -o none.exe
none.exe %1