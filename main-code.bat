@ECHO OFF 

:: This batch starts DokWatcher and ScanManager Apps.

set source_folder=%CD%
set dest_folder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
set cmlab_folder=C:\Windows\System32

:: ECHO %source_folder%
:: ECHO %dest_folder%
:: ECHO %cmlab_folder%
 
cd %dest_folder%
if exist CMLab.bat (

	cd %cmlab_folder%
 
	if exist dokwatcher.exe (
		if exist ScanManager.exe (
			START	dokwatcher
			START	scanmanager
			:: service needed to track utilization - Restarting
			taskkill /F /IM Intel.SUS.PlatformUtilization.exe
			net stop "SUSClient"
			net start "SUSClient"
		)
	) else (

		ECHO ==================================
		ECHO CMLab tools were not found.
		ECHO Please contact to GDC CMLab Leader.
		ECHO ==================================
		PAUSE
)
) else (
	ECHO =============================================================
	ECHO.
	ECHO Kindly wait... The necessary file is currently being copied.
	ECHO.
	copy "%source_folder%\CMLab.bat" "%dest_folder%" 
	START	dokwatcher
	START	scanmanager
	:: service needed to track utilization - Restarting
	taskkill /F /IM Intel.SUS.PlatformUtilization.exe
	net stop "SUSClient"
	net start "SUSClient"
	ECHO.
	ECHO Thank you for your patience; you are now free to remove me.
	ECHO.
	ECHO =============================================================
	PAUSE
)

