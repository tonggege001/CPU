`timescale 1ns / 1ps

module tb_mem_ins( );
    reg [9:0] Addr;
    wire [31:0] Dataout;
    Mem_Ins T1(Addr,Dataout);

    initial begin
    Addr<=0;
    #50 Addr = 1;
    #50 Addr = 2;
    #50 Addr = 3;
    #50 Addr = 4;
    #50 Addr = 221;
    #50 Addr = 6;
    end
endmodule
