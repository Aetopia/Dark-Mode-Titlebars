#include <windows.h>
#include <dwmapi.h>
#include <shlobj.h>

static BOOL DarkMode = TRUE;
static BOOL *PDarkMode = &DarkMode;
DWORD DWMWA_USE_IMMERSIVE_DARK_MODE = 20;

void WinEventProc(
    __attribute__((unused)) HWINEVENTHOOK hWinEventHook,
    DWORD event,
    HWND hwnd,
    __attribute__((unused)) LONG idObject,
    __attribute__((unused)) LONG idChild,
    __attribute__((unused)) DWORD idEventThread,
    __attribute__((unused)) DWORD dwmsEventTime)
{
    if (event == EVENT_SYSTEM_FOREGROUND ||
        event == EVENT_OBJECT_CREATE)
        if (IsWindow(hwnd))
        {
            DwmSetWindowAttribute(hwnd, DWMWA_USE_IMMERSIVE_DARK_MODE, PDarkMode, 4);
            PostMessage(hwnd, WM_THEMECHANGED, 0, 0);
        };
}

int main(__attribute__((unused)) int argc, char *argv[])
{
    MSG msg;
    OSVERSIONINFOEX osvi;
    GetVersionEx((OSVERSIONINFO *)&osvi);
    if (osvi.dwBuildNumber >= 17763)
        DWMWA_USE_IMMERSIVE_DARK_MODE = 19;
    if (!(IsUserAnAdmin()))
    {
        ShellExecute(0, "runas", argv[0], NULL, NULL, 5);
        return 0;
    };

    SetWinEventHook(EVENT_SYSTEM_FOREGROUND,
                    EVENT_OBJECT_CREATE, 0,
                    WinEventProc, 0, 0,
                    WINEVENT_OUTOFCONTEXT);
    while (GetMessage(&msg, NULL, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    };
    return 0;
}