set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN P17 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN M17 [get_ports go]
set_property IOSTANDARD LVCMOS33 [get_ports go]
#模式选择
set_property PACKAGE_PIN T13 [get_ports {choose[0]} ]
set_property IOSTANDARD LVCMOS33 [get_ports {choose[0]} ]
set_property PACKAGE_PIN H6 [get_ports {choose[1]} ]
set_property IOSTANDARD LVCMOS33 [get_ports {choose[1]} ]
set_property PACKAGE_PIN U12 [get_ports {choose[2]} ]
set_property IOSTANDARD LVCMOS33 [get_ports {choose[2]} ]
#内存地址选择
set_property  PACKAGE_PIN J15 [get_ports {memshownum[0]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[0]}]

set_property  PACKAGE_PIN L16 [get_ports {memshownum[1]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[1]}]

set_property  PACKAGE_PIN M13 [get_ports {memshownum[2]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[2]}]

set_property  PACKAGE_PIN R15 [get_ports {memshownum[3]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[3]}]

set_property  PACKAGE_PIN R17 [get_ports {memshownum[4]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[4]}]

set_property  PACKAGE_PIN T18 [get_ports {memshownum[5]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[5]}]

set_property  PACKAGE_PIN U18 [get_ports {memshownum[6]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[6]}]

set_property  PACKAGE_PIN R13 [get_ports {memshownum[7]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[7]}]

set_property  PACKAGE_PIN T8  [get_ports {memshownum[8]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[8]}]

set_property  PACKAGE_PIN U8 [get_ports {memshownum[9]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {memshownum[9]}]
#变频

set_property  PACKAGE_PIN V10 [get_ports {Freq[1]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {Freq[1]}]

set_property  PACKAGE_PIN U11  [get_ports {Freq[0]}]
set_property  IOSTANDARD LVCMOS33 [get_ports {Freq[0]}]
#七段译码管
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { AN[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { AN[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { AN[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { AN[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { AN[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { AN[6] }]; #IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { AN[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]

set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { SEG[0] }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { SEG[1] }]; #IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { SEG[2] }]; #IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { SEG[3] }]; #IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { SEG[4] }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { SEG[5] }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { SEG[6] }]; #IO_L4P_T0_D04_14 Sch=cg
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { SEG[7] }]; #IO_L19N_T3_A21_VREF_15 Sch=dp