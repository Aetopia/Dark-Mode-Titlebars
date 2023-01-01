# Dark Mode Titlebars

Dark mode titlebars everywhere.

## Usage

![Dark Mode Titlebars](https://cdn.discordapp.com/attachments/906577903356112946/1058974357000572979/Screenshot_15.png)

1. Download the latest release from [GitHub Releases](https://github.com/Aetopia/Dark-Mode-Titlebars/releases/latest).
2. Simply run `DMTB.exe` and then open any application.  
    Dark mode titlebars will be applied globally to any application that doesn't support it.
3. You can blacklist applications incase if the dark mode titlebar is causing issues.        
    Open `Blacklist.txt`, add applications the to blacklist.    
    If you update the Blacklist while DMTB is running, terminate the process and relaunch DMTB.       
    Example:    
    ```
    explorer.exe
    control.exe
    mspaint.exe
    ```
    > Applications that use a ribbon interface can cause issues with DMTB.
    You can disable the ribbon interface for Windows Explorer using [ExplorerPatcher](https://github.com/valinet/ExplorerPatcher).

## Build
1. Install Nim.
2. Install `winim`

    ```
    nimble install winim
    ```
3. Run `build.bat`.
