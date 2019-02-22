@echo off
set xv_path=D:\\software\\VIVADO\\Vivado\\2015.2\\bin
call %xv_path%/xsim tb_View_func_synth -key {Post-Synthesis:sim_1:Functional:tb_View} -tclbatch tb_View.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
