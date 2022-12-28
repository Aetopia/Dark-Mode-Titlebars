@echo off
nim c --app:gui -d:release -d:strip -o:"DMTB.exe" src/DMTB.nim  
:: Optional UPX compression.
upx --best --ultra-brute DMTB.exe>nul 2>&1