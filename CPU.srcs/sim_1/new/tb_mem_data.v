`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 14:14:06
// Design Name: 
// Module Name: tb_mem_data
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


module tb_mem_data( );
    reg clk;
  wire  MemWrite;
  wire [31:0] DAddr;
   wire [31:0]  DataIn;
   reg [31:0] DataOut;
    Mem_Data T3(clk, MemWrite,DAddr,DataIn,DataOut);
      always #10 clk = ~clk; 
       initial begin
       MemWrite=1;
       DAddr = 0;
       DataIn<=100;       
       #50 MemWrite=0;
      end
endmodule
