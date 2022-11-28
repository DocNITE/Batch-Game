:: Здесь мы прописываем какие-то глобальные макросы и переменные
:: Ну и затем идем в главное тело - main, в конце файла

set SCREEN_W=119
set SCREEN_H=25

@echo off
color 3
cd %userprofile%/desktop/BatchPraktika
setlocal ENABLEDELAYEDEXPANSION

goto:main

:: LOGGER - мой кастомный логгер
:log
  set text=%~1
  echo # %text%
exit /b 0

:: НАЧАЛО - именование задания и небольшая инициализация
:init
  call:log "-------------------------------------------------------------------------"
  call:log "* Batch Script Run System           by Maxim DocNightovich"
  call:log "-------------------------------------------------------------------------"
  call:log & :: Пробел для красивого оформления
  :: А здесь остальная инициализация
  title Batch Script Run System - Initialize...
exit /b 0

:: MAIN LOOP
:mainLoop
	title Batch Script Run System - Runing
	for /L %%Y in (1, 1, %SCREEN_H%) do (
		call:S_Print %%Y
	)
	call:log "- Press some 'KEY' to action."
	call:log "-"
	call:log "- AHTUNG! Now it only test win render"
	call:log "-"
	pause
	goto:mainLoop
exit /b 0

:S_Print
	set yP=%~1
	set xS=#
	for /L %%X in (1, 1, %SCREEN_W%) do (
		if %yP%==1 (
			set xS=!xS!#
		) else (
			if %yP%==%SCREEN_H% (
				set xS=!xS!#
			) else (
				if %%X==1 (
					set xS=!xS!
				) else (
					if %%X==%SCREEN_W% (
						set xS=!xS!#
					) else (
						set xS=!xS!/
					)
				)
			)
		)
	)
	echo %xS%
exit /b 0

:: ОСНОВНОЕ ТЕЛО ПРОГРАММЫ
:main
  :: Инициализируем
  call:init
  
  :: Тело прог. для задания
  ::call Task.bat >> KozhStashFedya.txt
  call Lib.bat func
  call:mainLoop
  
  :: Стопаем программу перед выходом
  ::pause
  exit
exit /b 0
