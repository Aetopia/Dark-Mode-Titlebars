# Dark Mode Titlebars

Dark mode titlebars everywhere.

![Dark Mode Titlebars](https://cdn.discordapp.com/attachments/906577903356112946/1058974357000572979/Screenshot_15.png)

## Usage

### Note
You don't actually need this application! Simply merging the following registry file achieves the functionality of Dark Mode Titlebars.       

Simply merge the following registry file.        
 
```ini
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM]
"ColorizationColor"=dword:c4000000
"ColorizationAfterglow"=dword:c4000000
"AccentColor"=dword:ff000000
"ColorPrevalence"=dword:00000001
"AccentColorInactive"=dword:ff2b2b2b

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Accent]
"AccentColorMenu"=dword:c4000000
```

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
