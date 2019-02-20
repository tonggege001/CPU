`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 13:14:01
// Design Name: 
// Module Name: tb_mem_ins
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_mem_ins(clk,Addr,Dataout);
    reg clk;
    wire [31:0] Addr;
    reg [31:0] Dataout;
    Mem_Ins T1(Addr,Dataout);
    always begin
    #(5) clk<=~clk;
    end
    initial begin
    clk<=0;
    Addr<=0;
    end
endmodule
