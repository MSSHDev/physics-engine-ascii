@echo off
cls
nasm -f win32 ball.asm -o ball.obj
gcc -m32 ball.obj -o ball.exe
ball.exe %1