`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 14:03:41
// Design Name: 
// Module Name: tb_pc
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


module tb_pc();
   reg clk;
   reg reset;
   wire EN;
   wire [31:0] PcNext;
    reg [31:0] PCAddr;

   PC T2( .CLK(clk), .Reset(reset), .EN(EN), .PcNext(PcNext),.PCAddr(PCAddr));
     always #10 clk = ~clk; 

        initial begin
       EN=1;
       reset = 1;
        PcNext<=30;
        #50 reset=0;
       end
endmodule
