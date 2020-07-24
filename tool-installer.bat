:: Software Package Installer
@echo off

mode con cols=80 lines=25
color 02

echo.
echo ###############################################################################
echo ######                CREATED AND DEVELOPED BY SADMANDMCX                ######
echo ###############################################################################
echo # ########       ##       #######  ####      ####       ##       ####      ## #
echo # ##            ####      ##     # ## ##    ## ##      ####      ## ##     ## #
echo # ##           ##  ##     ##     # ## ##    ## ##     ##  ##     ##  ##    ## #
echo # ########    ##    ##    ##     # ##  ##  ##  ##    ##    ##    ##   ##   ## #
echo #       ##   ##########   ##     # ##  ##  ##  ##   ##########   ##    ##  ## #
echo #       ##  ##        ##  ##     # ##   ####   ##  ##        ##  ##     ## ## #
echo # ######## ##          ## #######  ##    ##    ## ##          ## ##      #### #
echo ###############################################################################
echo.
echo.
echo              ###################################################
echo              #             PROGRAMED BY SADMANDMCX             #
echo              ###################################################
echo              #       WRITTEN AND DEVELOPED BY SADMANDMCX       #
echo              #  A INSTALLER SCRIPT FOR INSTALLING PROGRAMMING  #
echo              #   APPLICATIONS, SOFTWARES IDE'S AND SO ON...    #
echo              ###################################################
echo.

timeout /t 5
cls
mode con cols=70 lines=12
color 71

echo.
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +                                                                    +
echo +    Create your own software installer script, feel free to edit    +
echo +                      hit a star on my github                       +
echo +     https://github.com/psykicksam/win-coding-tool-batch-script     +
echo +                                                                    +
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.

timeout /t 10
cls
mode con cols=82 lines=25
color 02

NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo.
    echo ######################################
    echo #  ######  ##   ## ####### ##     ## #
    echo # ##    ## ##  ##  ##       ##   ##  #
    echo # ##    ## ## ##   ##        ## ##   #
    echo # ##    ## ####    #######    ##     #
    echo # ##    ## ## ##   ##         ##     #
    echo # ##    ## ##  ##  ##         ##     #
    echo #  ######  ##   ## #######    ##     #
    echo ######################################
    echo.
    echo.
    echo ###################################################
    echo #         ADMINISTRATOR PREVILLAGE OKEY           #
    echo ###################################################
    echo # THIS SCRIPT MUST NEED ADMINISTRATOR PREVILLAGE  #
    echo # TO WORK PROPERLY. FROM THE START MENU RUN THIS  #
    echo #            SCRIPT AS ADMINISTRATOR              #
    echo ###################################################
    echo.
) ELSE (
    echo.
    echo ###################################################
    echo # ######## ########  ########   ######  ########  #
    echo # ##       ##     ## ##     ## ##    ## ##     ## #
    echo # ##       ##     ## ##     ## ##    ## ##     ## #
    echo # ######## ########  ########  ##    ## ########  #
    echo # ##       ##   ##   ##   ##   ##    ## ##   ##   #
    echo # ##       ##    ##  ##    ##  ##    ## ##    ##  #
    echo # ######## ##     ## ##     ##  ######  ##     ## #
    echo ###################################################
    echo.
    echo.
    echo ###################################################
    echo #    ERROR: ADMINISTRATOR PREVILLAGE REQUIRED     #
    echo ###################################################
    echo # THIS SCRIPT MUST NEED ADMINISTRATOR PREVILLAGE  #
    echo # TO WORK PROPERLY. FROM THE START MENU RUN THIS  #
    echo #            SCRIPT AS ADMINISTRATOR              #
    echo ###################################################
    echo.
    PAUSE
    EXIT /B 1
)

timeout /t 5
cls
mode con cols=100 lines=20
color 02

:: All the commands are suitable for only powershell
:: Install Chocolety
SET install=""
SET /p install=Should Install Chocolatey (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_CHOCOLATEY
:INSTALL_CHOCOLATEY
IF "%install%" == "y" (
    echo Installing Chocolatey
    START /WAIT powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
timeout /t 3
) ELSE (
    echo CHOCOLATEY INSTALLATION SKIPED
)
timeout /t 3

:: Install Visual C++ Redistributable
SET install=""
SET /p install=Should Install Visual C++ Redistributable (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_VISAULACPPREDISTRIBUTABLE
:INSTALL_VISAULACPPREDISTRIBUTABLE
IF "%install%" == "y" (
    echo Installing Visual C++ Redistributable
    START /WAIT powershell -Command "choco install vcredist2005 -y"
    START /WAIT powershell -Command "choco install vcredist2008 -y"
    START /WAIT powershell -Command "choco install vcredist2010 -y"
    START /WAIT powershell -Command "choco install msvisualcplusplus2012-redist -y"
    START /WAIT powershell -Command "choco install msvisualcplusplus2013-redist -y"
    START /WAIT powershell -Command "choco install vcredist140 -y"
    echo Installed
) ELSE (
    echo VISUAL C++ REDISTRIBUTABLE INSTALLATION SKIPED
)
timeout /t 3

:: Install Visual Studio Code
SET install=""
SET /p install=Should Install Visual Studio Code (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_VSCODE
:INSTALL_VSCODE
IF "%install%" == "y" (
    echo Installing Visual Studio Code
    START /WAIT powershell -Command "choco install vscode; pause"
    echo Installed
) ELSE (
    echo VISUAL CODE INSTALLATION SKIPED
)
timeout /t 3

:: Install WSL
SET install=""
SET /p install=Should Install WSL and Ununtu (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_WSL
:INSTALL_WSL
IF "%install%" == "y" (
    echo Installing WSL
    :: START /WAIT powershell -Command "choco install wsl; pause"
    START /WAIT powershell -Command "choco install wsl-ubuntu-1804; pause"
    echo Installed
) ELSE (
    echo WSL INSTALLATION SKIPED
)
timeout /t 3

:: Install Windows Terminal
SET install=""
SET /p install=Should Install Windows Terminal (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_WINDOWSTERMINAL
:INSTALL_WINDOWSTERMINAL
IF "%install%" == "y" (
    echo Installing Windows Terminal
    START /WAIT powershell -Command "choco install microsoft-windows-terminal; pause"
    echo Installed
) ELSE (
    echo WINDOWS TERMINAL INSTALLATION SKIPED
)
timeout /t 3


:: Install Winrar
SET install=""
SET /p install=Should Install Winrar (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_WINRAR
:INSTALL_WINRAR
IF "%install%" == "y" (
    echo Installing Winrar
    START /WAIT powershell -Command "choco install winrar; pause"
    echo Installed
) ELSE (
    echo WINRAR INSTALLATION SKIPED
)
timeout /t 3

:: Install Java JDK 8 - choco
SET install=""
SET /p install=Should Install Java JDK 8 (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_JAVAJDK
:INSTALL_JAVAJDK
IF "%install%" == "y" (
    echo Installing Java JDK 8
    START /WAIT powershell -Command "choco install jdk8; pause"
    echo Installed
) ELSE (
    echo JAVA JDK 8 INSTALLATION SKIPED
)
timeout /t 3

:: Install Python - choco
SET install=""
SET /p install=Should Install Python (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_PYTHON
:INSTALL_PYTHON
IF "%install%" == "y" (
    echo Installing Python
    START /WAIT powershell -Command "choco install python; pause"
    echo Installed
) ELSE (
    echo PYTHON INSTALLATION SKIPED
)
timeout /t 3

:: Install NodeJS - choco
SET install=""
SET /p install=Should Install NodeJS (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_NODEJS
:INSTALL_NODEJS
IF "%install%" == "y" (
    echo Installing NodeJS
    START /WAIT powershell -Command "choco install nodejs; pause"
    echo Installed
) ELSE (
    echo NODEJS INSTALLATION SKIPED
)
timeout /t 3

:: Install Deno - choco
SET install=""
SET /p install=Should Install Deno (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_DENO
:INSTALL_DENO
IF "%install%" == "y" (
    echo Installing Deno
    START /WAIT powershell -Command "choco install deno; pause"
    echo Installed
) ELSE (
    echo DENO INSTALLATION SKIPED
)
timeout /t 3

:: Install Rust - curl
SET install=""
SET /p install=Should Install Rust (Rustup) (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_RUSTUP
:INSTALL_RUSTUP
IF "%install%" == "y" (
    echo Installing Rust Rustup
    START /WAIT wsl -d Ubuntu-18.04 sh -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    echo Installed
) ELSE (
    echo RUST-RUSTUP INSTALLATION SKIPED
)
timeout /t 3
:: Install Git - choco
SET install=""
SET /p install=Should Install Git (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_GIT
:INSTALL_GIT
IF "%install%" == "y" (
    echo Installing Git
    START /WAIT powershell -Command "choco install git; pause"
    echo Installed
) ELSE (
    echo GIT INSTALLATION SKIPED
)
timeout /t 3

:: Install IntelliJ IDEA - choco
SET install=""
SET /p install=Should Install Intellij IDEA Community (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_INTELLIJ_IDEA_COMMUNITY
:INSTALL_INTELLIJ_IDEA_COMMUNITY
IF "%install%" == "y" (
    echo Installing Intellij IDEA Community
    START /WAIT powershell -Command "choco install intellijidea-community; pause"
    echo Installed
) ELSE (
    echo INTELLIJ IDEA COMMUNITY INSTALLATION SKIPED
)
timeout /t 3

:: Install Intellij Pycharm Community - choco
SET install=""
SET /p install=Should Install Intellij Pycharm Community (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_INTELLIJ_PYCHARM_COMMUNITY
:INSTALL_INTELLIJ_PYCHARM_COMMUNITY
IF "%install%" == "y" (
    echo Installing Intellij Pycharm Community
    START /WAIT powershell -Command "choco install pycharm-community; pause"
    echo Installed
) ELSE (
    echo INTELLIJ PYCHARM COMMUNITY INSTALLATION SKIPED
)
timeout /t 3

:: Install Android Studio - choco
SET install=""
SET /p install=Should Install Android Studio (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_ANDROID_STUDIO
:INSTALL_ANDROID_STUDIO
IF "%install%" == "y" (
    echo Installing Android Studio
    START /WAIT powershell -Command "choco install androidstudio; pause"
    echo Installed
) ELSE (
    echo ANDROID STUDIO INSTALLATION SKIPED
)
timeout /t 3

:: Install Android SDK - choco
SET install=""
SET /p install=Should Install Android SDK (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_ANDROID_SDK
:INSTALL_ANDROID_SDK
IF "%install%" == "y" (
    echo Installing Android Studio
    START /WAIT powershell -Command "choco install android-sdk; pause"
    echo Installed
) ELSE (
    echo ANDROID SDK INSTALLATION SKIPED
)
timeout /t 3

:: Install Unity & Unity Hub - choco
SET install=""
SET /p install=Should Install Unity and Unity Hub (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_UNITYUNITYHUB
:INSTALL_UNITYUNITYHUB
IF "%install%" == "y" (
    echo Installing Unity and Unity Hub
    START /WAIT powershell -Command "choco install unity; pause"
    START /WAIT powershell -Command "choco install unity-hub --ignore-checksums; pause"
    :: Install Unity Hub From Website Is Better
    echo Installed
) ELSE (
    echo UNITY AND UNITY HUB INSTALLATION SKIPED
)
timeout /t 3

:: Install MongoDB - choco
SET install=""
SET /p install=Should Install Mongo DB (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_MONGO_DB
:INSTALL_MONGO_DB
IF "%install%" == "y" (
    echo Installing Mongo DB
    START /WAIT powershell -Command "choco install mongodb; pause"
    echo Installed
) ELSE (
    echo MONGO DB INSTALLATION SKIPED
)
timeout /t 3

:: Install MySQL - choco
SET install=""
SET /p install=Should Install MySQL (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_MYSQL
:INSTALL_MYSQL
IF "%install%" == "y" (
    echo Installing MySQL
    START /WAIT powershell -Command "choco install mysql; pause"
    echo Installed
) ELSE (
    echo MYSQL INSTALLATION SKIPED
)
timeout /t 3

:: Install Visual Studio Community & .Net Core Tools - choco
SET install=""
SET /p install=Should Install Visual Studio Community 2019 and .Net Core Tools (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_VISUALSTUDIOCOMMUNITYANDDOTNETCORETOOLS
:INSTALL_VISUALSTUDIOCOMMUNITYANDDOTNETCORETOOLS
IF "%install%" == "y" (
    echo Installing Visual Studio 2019 and .Net Core Tools
    START /WAIT powershell -Command "choco install visualstudio2019community; pause"
    START /WAIT powershell -Command "choco install visualstudio2019-workload-netcorebuildtools; pause"
    START /WAIT powershell -Command "choco install visualstudio2019-workload-netcoretools; pause"
    echo Installed
) ELSE (
    echo VISUAL STUDIO COMMUNITY WITH DOT NET CORE TOOLS INSTALLATION SKIPED
)
timeout /t 3

:: Install Blender - choco
SET install=""
SET /p install=Should Install Blender (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_BLENDER
:INSTALL_BLENDER
IF "%install%" == "y" (
    echo Installing Blender
    START /WAIT powershell -Command "choco install blender; pause"
    echo Installed
) ELSE (
    echo BLENDER INSTALLATION SKIPED
)
timeout /t 3

:: Install Virtual Box - choco
SET install=""
SET /p install=Should Install Virtual Box (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_VIRTUALBOX
:INSTALL_VIRTUALBOX
IF "%install%" == "y" (
    echo Installing Virtual Box
    START /WAIT powershell -Command "choco install virtualbox; pause"
    echo Installed
) ELSE (
    echo VIRTUAL BOX INSTALLATION SKIPED
)
timeout /t 3

:: Install HeidiSQL - choco
SET install=""
SET /p install=Should Install HeidiSQL (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_HEIDISQL
:INSTALL_HEIDISQL
IF "%install%" == "y" (
    echo Installing HeidiSQL
    START /WAIT powershell -Command "choco install heidisql; pause"
    echo Installed
) ELSE (
    echo HEIDISQL INSTALLATION SKIPED
)
timeout /t 3

:: VSCode Extensions - code
SET install=""
SET /p install=Should All the VS Code Extenstions (y/n) [DEFAULT/ENTER 'NO']? 
GOTO INSTALL_VS_CODE_EXTENSION
:INSTALL_VS_CODE_EXTENSION
IF "%install%" == "y" (
    echo Installing VS Code Extension
    START /WAIT powershell -Command "code --install-extension coenraads.bracket-pair-colorizer-2"
    START /WAIT powershell -Command "code --install-extension dbaeumer.vscode-eslint"
    START /WAIT powershell -Command "code --install-extension streetsidesoftware.code-spell-checker"
    START /WAIT powershell -Command "code --install-extension formulahendry.auto-close-tag"
    START /WAIT powershell -Command "code --install-extension mikestead.dotenv"
    START /WAIT powershell -Command "code --install-extension christian-kohler.path-intellisense"
    START /WAIT powershell -Command "code --install-extension davidanson.vscode-markdownlint"
    START /WAIT powershell -Command "code --install-extension pkief.material-icon-theme"
    START /WAIT powershell -Command "code --install-extension equinusocio.vsc-material-theme"
    START /WAIT powershell -Command "code --install-extension mitchdenny.ecdc"
    START /WAIT powershell -Command "code --install-extension humao.rest-client"
    START /WAIT powershell -Command "code --install-extension aaron-bond.better-comments"
    START /WAIT powershell -Command "code --install-extension ritwickdey.liveserver"
    START /WAIT powershell -Command "code --install-extension ms-vscode.vscode-typescript-tslint-plugin"
    START /WAIT powershell -Command "code --install-extension eamodio.gitlens"
    START /WAIT powershell -Command "code --install-extension huizhou.githd"
    START /WAIT powershell -Command "code --install-extension mhutchie.git-graph"
    START /WAIT powershell -Command "code --install-extension msjsdiag.debugger-for-chrome"
    START /WAIT powershell -Command "code --install-extension k--kato.intellij-idea-keybindings"
    START /WAIT powershell -Command "code --install-extension oderwat.indent-rainbow"
    START /WAIT powershell -Command "code --install-extension vscode-icons-team.vscode-icons"
    START /WAIT powershell -Command "code --install-extension dsebastien.vscode-python-pack"
    START /WAIT powershell -Command "code --install-extension formulahendry.code-runner"
    START /WAIT powershell -Command "code --install-extension ms-python.anaconda-extension-pack"
    START /WAIT powershell -Command "code --install-extension shardulm94.trailing-spaces"
    START /WAIT powershell -Command "code --install-extension thebarkman.vscode-djaneiro"
    START /WAIT powershell -Command "code --install-extension msjsdiag.vscode-react-native"
    START /WAIT powershell -Command "code --install-extension mgmcdermott.vscode-language-babel"
    START /WAIT powershell -Command "code --install-extension flowtype.flow-for-vscode"
    START /WAIT powershell -Command "code --install-extension eg2.vscode-npm-script"
    START /WAIT powershell -Command "code --install-extension christian-kohler.npm-intellisense"
    START /WAIT powershell -Command "code --install-extension dsznajder.es7-react-js-snippets"
    START /WAIT powershell -Command "code --install-extension alexeyvax.vscode-open-native-terminal"
    START /WAIT powershell -Command "code --install-extension zhuangtongfa.material-theme"
    START /WAIT powershell -Command "code --install-extension ofhumanbondage.react-proptypes-intellisense"
    START /WAIT powershell -Command "code --install-extension suming.react-proptypes-generate"
    START /WAIT powershell -Command "code --install-extension devendra.react-code-snippet"
    START /WAIT powershell -Command "code --install-extension planbcoding.vscode-react-refactor"
    START /WAIT powershell -Command "code --install-extension idbartosz.darkpp-italic"
    START /WAIT powershell -Command "code --install-extension bmealhouse.shifty-spicy-theme-pack"
    START /WAIT powershell -Command "code --install-extension ameerthehacker.deno-vscode"
    START /WAIT powershell -Command "code --install-extension rust-lang.rust"
    START /WAIT powershell -Command "code --install-extension matklad.rust-analyzer"
    START /WAIT powershell -Command "code --install-extension miqh.vscode-language-rust"
    START /WAIT powershell -Command "code --install-extension miqh.vscode-language-rust"
    START /WAIT powershell -Command "code --install-extension ms-azuretools.vscode-docker"
    START /WAIT powershell -Command "code --install-extension formulahendry.docker-explorer"
    START /WAIT powershell -Command "code --install-extension henriiik.docker-linter"
    START /WAIT powershell -Command "code --install-extension formulahendry.docker-extension-pack"
    START /WAIT powershell -Command "code --install-extension ms-vscode-remote.remote-wsl"
    echo Installed
) ELSE (
    echo VS CODE EXTENSION INSTALLATION SKIPED
)

timeout /t 3
cls
mode con cols=80 lines=15
color 74

echo.
echo ################################################################################
echo #  #######  #######  ###       ### #######  ##      ######## ######## ######## #
echo # ##       ##     ## ## #     # ## ##     # ##      ##          ##    ##       #
echo # ##       ##     ## ##  #   #  ## ##     # ##      ##          ##    ##       #
echo # ##       ##     ## ##   # #   ## #######  ##      #######     ##    #######  #
echo # ##       ##     ## ##    #    ## ##       ##      ##          ##    ##       #
echo # ##       ##     ## ##         ## ##       ##      ##          ##    ##       #
echo #  #######  #######  ##         ## ##       ####### ########    ##    ######## #
echo ################################################################################
echo.

PAUSE
EXIT /B 1








