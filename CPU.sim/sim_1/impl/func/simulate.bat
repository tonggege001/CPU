@echo off
set xv_path=D:\\software\\VIVADO\\Vivado\\2015.2\\bin
call %xv_path%/xsim tb_CPU_func_impl -key {Post-Implementation:sim_1:Functional:tb_CPU} -tclbatch tb_CPU.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
