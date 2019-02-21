# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.cache/wt [current_project]
set_property parent.project_path D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Reg_File.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Mem_Ins.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Mem_Data.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Controller.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Alu.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Datapath.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Divider.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/Button_Signal.v
  D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.srcs/sources_1/new/CPU.v
}
synth_design -top CPU -part xc7a100tcsg324-1
write_checkpoint -noxdef CPU.dcp
catch { report_utilization -file CPU_utilization_synth.rpt -pb CPU_utilization_synth.pb }