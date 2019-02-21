// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Feb 21 13:08:43 2019
// Host        : DESKTOP-2EGO8KQ running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/ARCHIVE/VIVADO_WORKPLACE/CPU/CPU.sim/sim_1/synth/func/tb_datapath_func_synth.v
// Design      : Controller
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module Controller
   (OP,
    Func,
    AluOp,
    MemtoReg,
    MemWrite,
    AluSrc,
    RegWrite,
    Syscall,
    SignedExt,
    RegDst,
    BEQ,
    BNE,
    JR,
    JMP,
    JAL);
  input [5:0]OP;
  input [5:0]Func;
  output [3:0]AluOp;
  output MemtoReg;
  output MemWrite;
  output AluSrc;
  output RegWrite;
  output Syscall;
  output SignedExt;
  output RegDst;
  output BEQ;
  output BNE;
  output JR;
  output JMP;
  output JAL;

  wire [3:0]AluOp;
  wire [3:0]AluOp_OBUF;
  wire \AluOp_reg[0]_i_1_n_0 ;
  wire \AluOp_reg[0]_i_2_n_0 ;
  wire \AluOp_reg[0]_i_3_n_0 ;
  wire \AluOp_reg[0]_i_4_n_0 ;
  wire \AluOp_reg[0]_i_5_n_0 ;
  wire \AluOp_reg[1]_i_1_n_0 ;
  wire \AluOp_reg[1]_i_2_n_0 ;
  wire \AluOp_reg[1]_i_3_n_0 ;
  wire \AluOp_reg[2]_i_1_n_0 ;
  wire \AluOp_reg[2]_i_2_n_0 ;
  wire \AluOp_reg[2]_i_3_n_0 ;
  wire \AluOp_reg[2]_i_4_n_0 ;
  wire \AluOp_reg[2]_i_5_n_0 ;
  wire \AluOp_reg[2]_i_6_n_0 ;
  wire \AluOp_reg[3]_i_1_n_0 ;
  wire \AluOp_reg[3]_i_2_n_0 ;
  wire \AluOp_reg[3]_i_3_n_0 ;
  wire \AluOp_reg[3]_i_4_n_0 ;
  wire \AluOp_reg[3]_i_5_n_0 ;
  wire \AluOp_reg[3]_i_6_n_0 ;
  wire \AluOp_reg[3]_i_7_n_0 ;
  wire AluSrc;
  wire AluSrc_OBUF;
  wire BEQ;
  wire BEQ_OBUF;
  wire BNE;
  wire BNE_OBUF;
  wire [5:0]Func;
  wire [5:0]Func_IBUF;
  wire JAL;
  wire JAL_OBUF;
  wire JMP;
  wire JMP_OBUF;
  wire JR;
  wire JR_OBUF;
  wire MemWrite;
  wire MemWrite_OBUF;
  wire MemtoReg;
  wire MemtoReg_OBUF;
  wire [5:0]OP;
  wire [5:0]OP_IBUF;
  wire RegDst;
  wire RegDst_OBUF;
  wire RegWrite;
  wire RegWrite_OBUF;
  wire RegWrite_OBUF_inst_i_2_n_0;
  wire RegWrite_OBUF_inst_i_3_n_0;
  wire RegWrite_OBUF_inst_i_4_n_0;
  wire SignedExt;
  wire SignedExt_OBUF;
  wire Syscall;
  wire Syscall_OBUF;
  wire Syscall_OBUF_inst_i_2_n_0;

  OBUF \AluOp_OBUF[0]_inst 
       (.I(AluOp_OBUF[0]),
        .O(AluOp[0]));
  OBUF \AluOp_OBUF[1]_inst 
       (.I(AluOp_OBUF[1]),
        .O(AluOp[1]));
  OBUF \AluOp_OBUF[2]_inst 
       (.I(AluOp_OBUF[2]),
        .O(AluOp[2]));
  OBUF \AluOp_OBUF[3]_inst 
       (.I(AluOp_OBUF[3]),
        .O(AluOp[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \AluOp_reg[0] 
       (.CLR(1'b0),
        .D(\AluOp_reg[0]_i_1_n_0 ),
        .G(\AluOp_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(AluOp_OBUF[0]));
  LUT6 #(
    .INIT(64'hEEEEFEEEFEEEFEEE)) 
    \AluOp_reg[0]_i_1 
       (.I0(\AluOp_reg[0]_i_2_n_0 ),
        .I1(\AluOp_reg[0]_i_3_n_0 ),
        .I2(\AluOp_reg[0]_i_4_n_0 ),
        .I3(\AluOp_reg[0]_i_5_n_0 ),
        .I4(OP_IBUF[2]),
        .I5(OP_IBUF[0]),
        .O(\AluOp_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    \AluOp_reg[0]_i_2 
       (.I0(Func_IBUF[3]),
        .I1(Func_IBUF[5]),
        .I2(Func_IBUF[2]),
        .I3(Func_IBUF[1]),
        .I4(Func_IBUF[0]),
        .I5(\AluOp_reg[2]_i_5_n_0 ),
        .O(\AluOp_reg[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000004000400440)) 
    \AluOp_reg[0]_i_3 
       (.I0(Func_IBUF[1]),
        .I1(\AluOp_reg[2]_i_5_n_0 ),
        .I2(Func_IBUF[5]),
        .I3(Func_IBUF[3]),
        .I4(Func_IBUF[0]),
        .I5(Func_IBUF[2]),
        .O(\AluOp_reg[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \AluOp_reg[0]_i_4 
       (.I0(OP_IBUF[3]),
        .I1(OP_IBUF[1]),
        .O(\AluOp_reg[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \AluOp_reg[0]_i_5 
       (.I0(OP_IBUF[4]),
        .I1(OP_IBUF[5]),
        .O(\AluOp_reg[0]_i_5_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \AluOp_reg[1] 
       (.CLR(1'b0),
        .D(\AluOp_reg[1]_i_1_n_0 ),
        .G(\AluOp_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(AluOp_OBUF[1]));
  LUT6 #(
    .INIT(64'h4040001040400000)) 
    \AluOp_reg[1]_i_1 
       (.I0(OP_IBUF[1]),
        .I1(OP_IBUF[2]),
        .I2(\AluOp_reg[1]_i_2_n_0 ),
        .I3(Func_IBUF[4]),
        .I4(OP_IBUF[3]),
        .I5(\AluOp_reg[1]_i_3_n_0 ),
        .O(\AluOp_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \AluOp_reg[1]_i_2 
       (.I0(OP_IBUF[5]),
        .I1(OP_IBUF[4]),
        .I2(OP_IBUF[0]),
        .O(\AluOp_reg[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00008038)) 
    \AluOp_reg[1]_i_3 
       (.I0(Func_IBUF[5]),
        .I1(Func_IBUF[2]),
        .I2(Func_IBUF[1]),
        .I3(Func_IBUF[0]),
        .I4(Func_IBUF[3]),
        .O(\AluOp_reg[1]_i_3_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \AluOp_reg[2] 
       (.CLR(1'b0),
        .D(\AluOp_reg[2]_i_1_n_0 ),
        .G(\AluOp_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(AluOp_OBUF[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFF0F00020)) 
    \AluOp_reg[2]_i_1 
       (.I0(\AluOp_reg[2]_i_2_n_0 ),
        .I1(OP_IBUF[1]),
        .I2(RegWrite_OBUF_inst_i_3_n_0),
        .I3(Func_IBUF[4]),
        .I4(OP_IBUF[3]),
        .I5(\AluOp_reg[2]_i_3_n_0 ),
        .O(\AluOp_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h44040004)) 
    \AluOp_reg[2]_i_2 
       (.I0(Func_IBUF[2]),
        .I1(Func_IBUF[5]),
        .I2(Func_IBUF[0]),
        .I3(Func_IBUF[3]),
        .I4(Func_IBUF[1]),
        .O(\AluOp_reg[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF8FFF8F8F8F8F8F8)) 
    \AluOp_reg[2]_i_3 
       (.I0(\AluOp_reg[1]_i_2_n_0 ),
        .I1(\AluOp_reg[0]_i_4_n_0 ),
        .I2(\AluOp_reg[2]_i_4_n_0 ),
        .I3(Func_IBUF[1]),
        .I4(\AluOp_reg[2]_i_5_n_0 ),
        .I5(\AluOp_reg[2]_i_6_n_0 ),
        .O(\AluOp_reg[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00010000)) 
    \AluOp_reg[2]_i_4 
       (.I0(OP_IBUF[2]),
        .I1(OP_IBUF[4]),
        .I2(OP_IBUF[5]),
        .I3(OP_IBUF[1]),
        .I4(OP_IBUF[3]),
        .O(\AluOp_reg[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \AluOp_reg[2]_i_5 
       (.I0(Func_IBUF[4]),
        .I1(OP_IBUF[0]),
        .I2(OP_IBUF[4]),
        .I3(OP_IBUF[5]),
        .I4(OP_IBUF[2]),
        .I5(OP_IBUF[1]),
        .O(\AluOp_reg[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0710)) 
    \AluOp_reg[2]_i_6 
       (.I0(Func_IBUF[2]),
        .I1(Func_IBUF[0]),
        .I2(Func_IBUF[3]),
        .I3(Func_IBUF[5]),
        .O(\AluOp_reg[2]_i_6_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \AluOp_reg[3] 
       (.CLR(1'b0),
        .D(\AluOp_reg[3]_i_1_n_0 ),
        .G(\AluOp_reg[3]_i_2_n_0 ),
        .GE(1'b1),
        .Q(AluOp_OBUF[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFFCC000200)) 
    \AluOp_reg[3]_i_1 
       (.I0(\AluOp_reg[3]_i_3_n_0 ),
        .I1(OP_IBUF[3]),
        .I2(Func_IBUF[4]),
        .I3(RegWrite_OBUF_inst_i_3_n_0),
        .I4(OP_IBUF[1]),
        .I5(\AluOp_reg[3]_i_4_n_0 ),
        .O(\AluOp_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFAAAFAAFFAAAEAA)) 
    \AluOp_reg[3]_i_2 
       (.I0(\AluOp_reg[3]_i_5_n_0 ),
        .I1(\AluOp_reg[3]_i_6_n_0 ),
        .I2(Func_IBUF[4]),
        .I3(RegWrite_OBUF_inst_i_3_n_0),
        .I4(OP_IBUF[1]),
        .I5(\AluOp_reg[3]_i_7_n_0 ),
        .O(\AluOp_reg[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h4A400000)) 
    \AluOp_reg[3]_i_3 
       (.I0(Func_IBUF[3]),
        .I1(Func_IBUF[0]),
        .I2(Func_IBUF[2]),
        .I3(Func_IBUF[1]),
        .I4(Func_IBUF[5]),
        .O(\AluOp_reg[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    \AluOp_reg[3]_i_4 
       (.I0(OP_IBUF[4]),
        .I1(OP_IBUF[5]),
        .I2(OP_IBUF[0]),
        .I3(OP_IBUF[2]),
        .I4(OP_IBUF[1]),
        .I5(OP_IBUF[3]),
        .O(\AluOp_reg[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0005000500260004)) 
    \AluOp_reg[3]_i_5 
       (.I0(OP_IBUF[1]),
        .I1(OP_IBUF[3]),
        .I2(OP_IBUF[5]),
        .I3(OP_IBUF[4]),
        .I4(OP_IBUF[0]),
        .I5(OP_IBUF[2]),
        .O(\AluOp_reg[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0808A40F)) 
    \AluOp_reg[3]_i_6 
       (.I0(Func_IBUF[5]),
        .I1(Func_IBUF[1]),
        .I2(Func_IBUF[2]),
        .I3(Func_IBUF[0]),
        .I4(Func_IBUF[3]),
        .O(\AluOp_reg[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h0026)) 
    \AluOp_reg[3]_i_7 
       (.I0(Func_IBUF[5]),
        .I1(Func_IBUF[3]),
        .I2(Func_IBUF[0]),
        .I3(Func_IBUF[1]),
        .O(\AluOp_reg[3]_i_7_n_0 ));
  OBUF AluSrc_OBUF_inst
       (.I(AluSrc_OBUF),
        .O(AluSrc));
  LUT6 #(
    .INIT(64'h0401040003030000)) 
    AluSrc_OBUF_inst_i_1
       (.I0(OP_IBUF[2]),
        .I1(OP_IBUF[5]),
        .I2(OP_IBUF[4]),
        .I3(OP_IBUF[0]),
        .I4(OP_IBUF[3]),
        .I5(OP_IBUF[1]),
        .O(AluSrc_OBUF));
  OBUF BEQ_OBUF_inst
       (.I(BEQ_OBUF),
        .O(BEQ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    BEQ_OBUF_inst_i_1
       (.I0(OP_IBUF[3]),
        .I1(OP_IBUF[2]),
        .I2(OP_IBUF[1]),
        .I3(OP_IBUF[0]),
        .I4(OP_IBUF[4]),
        .I5(OP_IBUF[5]),
        .O(BEQ_OBUF));
  OBUF BNE_OBUF_inst
       (.I(BNE_OBUF),
        .O(BNE));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    BNE_OBUF_inst_i_1
       (.I0(OP_IBUF[4]),
        .I1(OP_IBUF[5]),
        .I2(OP_IBUF[0]),
        .I3(OP_IBUF[3]),
        .I4(OP_IBUF[1]),
        .I5(OP_IBUF[2]),
        .O(BNE_OBUF));
  IBUF \Func_IBUF[0]_inst 
       (.I(Func[0]),
        .O(Func_IBUF[0]));
  IBUF \Func_IBUF[1]_inst 
       (.I(Func[1]),
        .O(Func_IBUF[1]));
  IBUF \Func_IBUF[2]_inst 
       (.I(Func[2]),
        .O(Func_IBUF[2]));
  IBUF \Func_IBUF[3]_inst 
       (.I(Func[3]),
        .O(Func_IBUF[3]));
  IBUF \Func_IBUF[4]_inst 
       (.I(Func[4]),
        .O(Func_IBUF[4]));
  IBUF \Func_IBUF[5]_inst 
       (.I(Func[5]),
        .O(Func_IBUF[5]));
  OBUF JAL_OBUF_inst
       (.I(JAL_OBUF),
        .O(JAL));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    JAL_OBUF_inst_i_1
       (.I0(OP_IBUF[2]),
        .I1(OP_IBUF[3]),
        .I2(OP_IBUF[0]),
        .I3(OP_IBUF[1]),
        .I4(OP_IBUF[5]),
        .I5(OP_IBUF[4]),
        .O(JAL_OBUF));
  OBUF JMP_OBUF_inst
       (.I(JMP_OBUF),
        .O(JMP));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    JMP_OBUF_inst_i_1
       (.I0(OP_IBUF[3]),
        .I1(OP_IBUF[1]),
        .I2(OP_IBUF[2]),
        .I3(OP_IBUF[5]),
        .I4(OP_IBUF[4]),
        .I5(OP_IBUF[0]),
        .O(JMP_OBUF));
  OBUF JR_OBUF_inst
       (.I(JR_OBUF),
        .O(JR));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    JR_OBUF_inst_i_1
       (.I0(Func_IBUF[3]),
        .I1(Func_IBUF[5]),
        .I2(Func_IBUF[2]),
        .I3(Func_IBUF[1]),
        .I4(Func_IBUF[0]),
        .I5(Syscall_OBUF_inst_i_2_n_0),
        .O(JR_OBUF));
  OBUF MemWrite_OBUF_inst
       (.I(MemWrite_OBUF),
        .O(MemWrite));
  LUT6 #(
    .INIT(64'h0000200000000000)) 
    MemWrite_OBUF_inst_i_1
       (.I0(OP_IBUF[3]),
        .I1(OP_IBUF[2]),
        .I2(OP_IBUF[0]),
        .I3(OP_IBUF[1]),
        .I4(OP_IBUF[4]),
        .I5(OP_IBUF[5]),
        .O(MemWrite_OBUF));
  OBUF MemtoReg_OBUF_inst
       (.I(MemtoReg_OBUF),
        .O(MemtoReg));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    MemtoReg_OBUF_inst_i_1
       (.I0(OP_IBUF[2]),
        .I1(OP_IBUF[3]),
        .I2(OP_IBUF[0]),
        .I3(OP_IBUF[1]),
        .I4(OP_IBUF[4]),
        .I5(OP_IBUF[5]),
        .O(MemtoReg_OBUF));
  IBUF \OP_IBUF[0]_inst 
       (.I(OP[0]),
        .O(OP_IBUF[0]));
  IBUF \OP_IBUF[1]_inst 
       (.I(OP[1]),
        .O(OP_IBUF[1]));
  IBUF \OP_IBUF[2]_inst 
       (.I(OP[2]),
        .O(OP_IBUF[2]));
  IBUF \OP_IBUF[3]_inst 
       (.I(OP[3]),
        .O(OP_IBUF[3]));
  IBUF \OP_IBUF[4]_inst 
       (.I(OP[4]),
        .O(OP_IBUF[4]));
  IBUF \OP_IBUF[5]_inst 
       (.I(OP[5]),
        .O(OP_IBUF[5]));
  OBUF RegDst_OBUF_inst
       (.I(RegDst_OBUF),
        .O(RegDst));
  LUT6 #(
    .INIT(64'h0808A62F00000000)) 
    RegDst_OBUF_inst_i_1
       (.I0(Func_IBUF[5]),
        .I1(Func_IBUF[1]),
        .I2(Func_IBUF[2]),
        .I3(Func_IBUF[0]),
        .I4(Func_IBUF[3]),
        .I5(Syscall_OBUF_inst_i_2_n_0),
        .O(RegDst_OBUF));
  OBUF RegWrite_OBUF_inst
       (.I(RegWrite_OBUF),
        .O(RegWrite));
  LUT6 #(
    .INIT(64'hEEAAEFAAEEAAEEAA)) 
    RegWrite_OBUF_inst_i_1
       (.I0(RegWrite_OBUF_inst_i_2_n_0),
        .I1(OP_IBUF[3]),
        .I2(Func_IBUF[4]),
        .I3(RegWrite_OBUF_inst_i_3_n_0),
        .I4(OP_IBUF[1]),
        .I5(RegWrite_OBUF_inst_i_4_n_0),
        .O(RegWrite_OBUF));
  LUT6 #(
    .INIT(64'h00000404000F0000)) 
    RegWrite_OBUF_inst_i_2
       (.I0(OP_IBUF[2]),
        .I1(OP_IBUF[0]),
        .I2(OP_IBUF[4]),
        .I3(OP_IBUF[5]),
        .I4(OP_IBUF[3]),
        .I5(OP_IBUF[1]),
        .O(RegWrite_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    RegWrite_OBUF_inst_i_3
       (.I0(OP_IBUF[0]),
        .I1(OP_IBUF[4]),
        .I2(OP_IBUF[5]),
        .I3(OP_IBUF[2]),
        .O(RegWrite_OBUF_inst_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h4B550501)) 
    RegWrite_OBUF_inst_i_4
       (.I0(Func_IBUF[3]),
        .I1(Func_IBUF[0]),
        .I2(Func_IBUF[2]),
        .I3(Func_IBUF[1]),
        .I4(Func_IBUF[5]),
        .O(RegWrite_OBUF_inst_i_4_n_0));
  OBUF SignedExt_OBUF_inst
       (.I(SignedExt_OBUF),
        .O(SignedExt));
  LUT6 #(
    .INIT(64'h0000000321032000)) 
    SignedExt_OBUF_inst_i_1
       (.I0(OP_IBUF[0]),
        .I1(OP_IBUF[4]),
        .I2(OP_IBUF[5]),
        .I3(OP_IBUF[1]),
        .I4(OP_IBUF[3]),
        .I5(OP_IBUF[2]),
        .O(SignedExt_OBUF));
  OBUF Syscall_OBUF_inst
       (.I(Syscall_OBUF),
        .O(Syscall));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    Syscall_OBUF_inst_i_1
       (.I0(Func_IBUF[3]),
        .I1(Func_IBUF[5]),
        .I2(Func_IBUF[1]),
        .I3(Func_IBUF[2]),
        .I4(Func_IBUF[0]),
        .I5(Syscall_OBUF_inst_i_2_n_0),
        .O(Syscall_OBUF));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    Syscall_OBUF_inst_i_2
       (.I0(OP_IBUF[1]),
        .I1(OP_IBUF[2]),
        .I2(\AluOp_reg[0]_i_5_n_0 ),
        .I3(OP_IBUF[0]),
        .I4(Func_IBUF[4]),
        .I5(OP_IBUF[3]),
        .O(Syscall_OBUF_inst_i_2_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
