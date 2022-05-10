@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto InstallKeys
    ) else (
        echo Please Run with admin Credentials
    )
    
    pause >nul

:InstallKeys
    echo Installing Keys....
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\MS Setup (ACME)"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\MS Setup (ACME)\Table Files"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\3DMovie.exe"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\.3MM"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\.3MM\ShellNew"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Microsoft Kids Setup"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Microsoft Kids Setup\Clients"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker\DefaultIcon"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker\shell"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker\shell\open"
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker\shell\open\command"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft Kids\3D Movie Maker"
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Microsoft Kids"
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Microsoft Kids\3D Movie Maker"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft Kids\3D Movie Maker\Products"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Ms3DMovie"
    goto InstallValues

:InstallValues
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Microsoft Kids\3D Movie Maker" /ve /t "REG_SZ" /d "2"
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft Kids\3D Movie Maker" /v "InstallSubDir" /t "REG_SZ" /d "3D Movie Maker\\" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft Kids\3D Movie Maker" /v "InstallDirectory" /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\\" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker\shell\open\command" /ve /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\3D Movie Maker\3DMOVIE.EXE %%1" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\.3MM" /ve /t "REG_SZ" /d "3D Movie Maker" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\MS Setup (ACME)\Table Files" /v "3DMovie.exe(U)@v1" /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\Common Files\Setup\Ms3DMu.stf" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker\DefaultIcon" /ve /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\3D Movie Maker\3DMOVIE.EXE,1" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Microsoft Kids Setup" /v "Path" /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\Common Files\Setup\SETUP.EXE" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\3D Movie Maker" /ve /t "REG_SZ" /d "3D Movie" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\Microsoft Kids Setup\Clients" /v "C:\Program Files\Microsoft Kids\3D Movie Maker\3DMOVIE.EXE" /t "REG_SZ" /f
    ::reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Comic Sans MS Bold (TrueType)" /t "REG_SZ" /d "COMICBD.FOT" /f
    ::reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Comic Sans MS (TrueType)" /t "REG_SZ" /d "COMIC.FOT" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Classes\.3MM\ShellNew" /v "FileName" /t "REG_SZ" /d "3dmovie.3MM" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\3DMovie.exe" /ve /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\3D Movie Maker\3DMOVIE.EXE" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\3DMovie.exe" /v "Path" /t "REG_SZ" /d "C:\Program Files\Microsoft Kids\3D Movie Maker\\" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Ms3DMovie" /v "DisplayName" /t "REG_SZ" /d "Microsoft 3D Movie Maker 1.0" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft Kids\3D Movie Maker\Products" /v "2" /t "REG_SZ" /d "3D Movie Maker/3DMovie" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\SharedDlls" /v "C:\Program Files\Microsoft Kids\Common Files\Setup\SETUP.EXE" /t "REG_DWORD" /d "1" /f
    reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\Ms3DMovie" /v "UninstallString" /t "REG_SZ" /d "C:\PROGRA~1\MICROS~2\COMMON~1\Setup\setup.exe /L Ms3DMu.lst /W Ms3DMu.stf" /f
    goto CreateFolders

:CreateFolders
    mkdir "C:\Program Files\Microsoft Kids"\USERS\McZee\Movies
    md "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    mkdir "C:\Program Files\Microsoft Kids\Common Files"\Setup
    md "C:\Program Files\Microsoft Kids\3D Movie Maker"
    goto CopyFiles

:CopyFiles 
    xcopy /v ".\cd3\samples" "C:\Program Files\Microsoft Kids\USERS\McZee\Movies"
    xcopy /v ".\cd3\setup\bongo.3mm" "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    xcopy /v ".\cd3\setup\bridge.3mm" "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    xcopy /v ".\cd3\setup\dialogue.3mm" "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    xcopy /v ".\cd3\setup\jog.3mm" "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    xcopy /v ".\cd3\setup\mummy.3mm" "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    xcopy /v ".\cd3\setup\surprise.3mm" "C:\Program Files\Microsoft Kids\USERS\MELANIE"
    xcopy /v ".\cd3\pss\3dmm.hlp" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\pss\3dmm.cnt" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\pss\3dmm.fts" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\pss\3dmm.gid" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\3dmovie.chk" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\3dmovie.exe" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\actor.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\actresl.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\bkgds.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\bldghd.chk" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\help.chk" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\mtrl.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\prop.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\shared.chk" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\studio.chk" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovie\sound.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"
    xcopy /v ".\cd3\3dmovietbox.3th" "C:\Program Files\Microsoft Kids\3D Movie Maker"





