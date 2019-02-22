@echo off
set xv_path=D:\\software\\VIVADO\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 84249d45525347558246e7d4134ff288 -m64 --debug typical --relax --mt 2 --maxdelay -L xil_defaultlib -L simprims_ver -L secureip --snapshot tb_View_time_synth -transport_int_delays -pulse_r 0 -pulse_int_r 0 xil_defaultlib.tb_View xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
