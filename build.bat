@echo off
gcc -Wall -Wextra -mwindows -s -O3 src\DMTB.c -ldwmapi -o DMTB.exe
:: Optional UPX compression.
upx --best --ultra-brute DMTB.exe>nul 2>&1