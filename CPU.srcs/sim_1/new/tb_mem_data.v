`timescale 1ns / 1ps

module tb_mem_data( );
    reg Clk;
    reg Rst;
    reg Sel;
  reg  MemWrite;
  reg [31:0] Addr;
   reg [31:0]  Datain;
   wire [31:0] Dataout;
    Mem_Data T3(Clk,Addr,Datain,MemWrite,Sel,Dataout,Rst);
      always #10 Clk = ~Clk; 
       initial begin
       Clk<=1;
       MemWrite<=1;
       Addr <= 0;
       Datain<=100;  
       Rst<=0;  
       Sel<=15;   
       #50 Rst<=1;
       #10 MemWrite=1;
      end
endmodule
