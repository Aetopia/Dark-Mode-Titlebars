# Dark Mode Titlebars

Dark mode titlebars everywhere.

## Usage

![Dark Mode Titlebars](https://cdn.discordapp.com/attachments/809195707151679547/1054762384629170176/image.png)

1. Download the latest release from [GitHub Releases](https://github.com/Aetopia/Dark-Mode-Titlebars/releases/latest).
2. Simply run `DMTB.exe` and then open any application.  
    Dark mode titlebars will be applied globally to any application that doesn't support it.
3. You can blacklist applications incase if the dark mode titlebar is causing issues.        
    Open `Blacklist.txt`, add applications the to blacklist.      
    Example:    
    ```
    explorer.exe
    control.exe
    mspaint.exe
    ```

## Build
1. Install Nim.
2. Install `winim`
    ```
    nimble install winim
    ```
3. Run `build.bat`.
