@ECHO OFF 
TITLE CMLab-Tools-Starter
@REM This batch file is for the startup of all CMLab tools in order to correctly track all host activities.

set source_folder=%0
set dest_folder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
set cmlab_folder=C:\Windows\System32
set plat_utili=C:\Intel\UTZ\SetupSUSDetectionService\Release\

@REM ECHO %source_folder%
@REM ECHO %dest_folder%
@REM ECHO %cmlab_folder%
@REM ECHO %source_file_name%

@REM Check that the batch file is already in the StartUp directory.
 
@REM cd %dest_folder%
if exist "%dest_folder%\CMLab-starter.bat" (

	@REM Check if DokWatcher and Scanmanager exist, if so, run them.
	if exist "%cmlab_folder%\dokwatcher.exe" (
		if exist "%cmlab_folder%\ScanManager.exe" (

			START dokwatcher && (
				@REM dokwathcer starts successfully
			) || (
				ECHO ===================================================================
				ECHO dokwathcer is not working properly, please contact GDC CMLab Leader.
				ECHO Please contact to GDC CMLab Leader.
				ECHO ===================================================================
				PAUSE
			)

			START scanmanager && (
				@REM scanmanager starts successfully
			) || (
				ECHO ===================================================================
				ECHO scanmanager is not working properly, please contact GDC CMLab Leader.
				ECHO Please contact to GDC CMLab Leader.
				ECHO ===================================================================
				PAUSE
			)

		)
	) else (

		ECHO ==================================
		ECHO CMLab tools were not found.
		ECHO Please contact to GDC CMLab Leader.
		ECHO ==================================
		PAUSE
	)

	@REM Check if Intel.SUS.PlatformUtilization.exe exists, if so, run it.
	if exist %plat_utili% (

		if exist %plat_utili%\Intel.SUS.PlatformUtilization.exe (
				START C:\Intel\UTZ\SetupSUSDetectionService\Release\Intel.SUS.PlatformUtilization.exe && (
					@REM Intel.SUS.PlatformUtilization.exe starts successfully.
				) || (
					ECHO ============================================================================================
					ECHO 'Intel.SUS.PlatformUtilization.exe' is not working properly, please contact GDC CMLab Leader.
					ECHO Please contact to GDC CMLab Leader.
					ECHO ============================================================================================
					PAUSE
				)
		) else (
			ECHO ==================================
			ECHO The PlatformUtilization.exe was not found.
			ECHO Please contact to GDC CMLab Leader.
			ECHO ==================================
			PAUSE
		)

	) else (
		ECHO ==================================
		ECHO The %plat_utili% was not found.
		ECHO Please contact to GDC CMLab Leader.
		ECHO ==================================
		PAUSE
	)


) else (

	@REM If the batch file is not in the StartUp directory, proceed to locate it there from wherever it is.
	ECHO =============================================================
	ECHO.
	ECHO Kindly wait... The necessary file is currently being copied.
	ECHO.
	copy "%source_folder%" "%dest_folder%\CMLab-starter.bat" 

	@REM Check if DokWatcher and Scanmanager exist, if so, run them.
	if exist "%cmlab_folder%\dokwatcher.exe" (
		if exist "%cmlab_folder%\ScanManager.exe" (

			START dokwatcher && (
				@REM dokwathcer starts successfully
			) || (
				ECHO ===================================================================
				ECHO dokwathcer is not working properly, please contact GDC CMLab Leader.
				ECHO Please contact to GDC CMLab Leader.
				ECHO ===================================================================
				PAUSE
			)

			START scanmanager && (
				@REM scanmanager starts successfully
			) || (
				ECHO ===================================================================
				ECHO scanmanager is not working properly, please contact GDC CMLab Leader.
				ECHO Please contact to GDC CMLab Leader.
				ECHO ===================================================================
				PAUSE
			)

		)
	) else (

		ECHO ==================================
		ECHO CMLab tools were not found.
		ECHO Please contact to GDC CMLab Leader.
		ECHO ==================================
		PAUSE
	)

	@REM Check if Intel.SUS.PlatformUtilization.exe exists, if so, run it.
	if exist %plat_utili% (

		if exist %plat_utili%\Intel.SUS.PlatformUtilization.exe (
				START C:\Intel\UTZ\SetupSUSDetectionService\Release\Intel.SUS.PlatformUtilization.exe && (
					@REM Intel.SUS.PlatformUtilization.exe starts successfully.
				) || (
					ECHO 
					ECHO 'Intel.SUS.PlatformUtilization.exe' is not working properly, please contact GDC CMLab Leader.
					ECHO Please contact to GDC CMLab Leader.
					ECHO ============================================================================================
					PAUSE
				)
		) else (
			ECHO ==================================
			ECHO The PlatformUtilization.exe was not found.
			ECHO Please contact to GDC CMLab Leader.
			ECHO ==================================
			PAUSE
		)

	) else (
		ECHO ==================================
		ECHO The %plat_utili% was not found.
		ECHO Please contact to GDC CMLab Leader.
		ECHO ==================================
		PAUSE
	)
	

	ECHO.
	ECHO Thank you for your patience; you are now free to remove me.
	ECHO.
	ECHO =============================================================
	PAUSE
)
