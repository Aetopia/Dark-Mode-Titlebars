import winim/[lean, shell, extra]
import os
import strutils

if isAdmin():
    setCurrentDir(splitPath(getAppFilename())[0])
    if not fileExists("Blacklist.txt"):
        writeFile("Blacklist.txt", "")

var 
    DarkMode = true
    msg: MSG
    blacklist: seq[string]

proc IsProcessInBlacklist(hwnd: HWND): bool =
    var pid: DWORD 
    GetWindowThreadProcessId(hwnd, &pid)
    let
        hproc = OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, false, pid) 
        file = newString(MAX_PATH)
    GetModuleFileNameExA(hproc, 0, file, MAX_PATH)
    CloseHandle(hproc)
    if extractFilename(file).strip(chars = {'\0'}) in blacklist:
        return true
    return false

proc WinEventProc(hWinEventHook: HWINEVENTHOOK,
    event: DWORD,
    hwnd: HWND,
    idObject: LONG,
    idChild: LONG,
    idEventThread: DWORD,
    dwmsEventTime: DWORD): void {.stdcall.} =
    if event != EVENT_OBJECT_CREATE:
        return
    if idObject != OBJID_WINDOW or idChild != CHILDID_SELF:
        return
    if IsProcessInBlacklist(hwnd):
        return
    if DwmSetWindowAttribute(hwnd, 19, &DarkMode, 4) != S_OK:
        DwmSetWindowAttribute(hwnd, 20, &DarkMode, 4)

proc EnumWindowsProc(hwnd: HWND, lParam: LPARAM): WINBOOL {.stdcall.} = 
    if IsProcessInBlacklist(hwnd):
        return true 
    if DwmSetWindowAttribute(hwnd, 19, &DarkMode, 4) != S_OK:
        DwmSetWindowAttribute(hwnd, 20, &DarkMode, 4)
    return true

if not isMainModule:
    quit(0)
if not isAdmin():
    ShellExecute(0, "runas", getAppFilename(), nil, nil, 5)
    quit(0)

blacklist = readFile("Blacklist.txt").splitLines()
EnumWindows(EnumWindowsProc, 0)
SetWinEventHook(EVENT_OBJECT_CREATE, EVENT_OBJECT_CREATE, 0, WinEventProc, 0, 0, WINEVENT_OUTOFCONTEXT)
while GetMessage(&msg, 0, 0, 0):
    TranslateMessage(&msg);
    DispatchMessage(&msg);

