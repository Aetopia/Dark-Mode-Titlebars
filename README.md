# Dark Mode Titlebars

Dark mode titlebars everywhere.

![Dark Mode Titlebars](https://cdn.discordapp.com/attachments/906577903356112946/1058974357000572979/Screenshot_15.png)

## Usage

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

## Build
1. Install Nim.
2. Install `winim`

    ```
    nimble install winim
    ```
3. Run `build.bat`.
