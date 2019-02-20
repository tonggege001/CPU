`timescale 1ns / 1ps

module tb_regfile;
    reg Clk;
    reg [4:0]rA;
    reg [4:0]rB;
    reg [4:0]rW;
    reg WE;
    reg [31:0]wData;
    wire[31:0]A;
    wire[31:0]B;
    Reg_File T4(Clk,rA,rB,rW,WE,wData,A,B);
    always #5 Clk = ~Clk; 
    initial begin
    //≥ı ºªØ
        Clk <= 0;
        rA <= 0;
        rB <= 0;
        rW <= 0;
        WE <= 0;
        wData <= 0; 
       #50 WE <= 1;
           rA <= 1;
           rB <= 2;
           rW <=  3;
           wData <= 300;       
        #50 WE <= 0;
            rA <= 3;
            rB <= 4;
       #50 WE <= 1;     
        rA <= 1;
                 rB <= 2;
                 rW <=  4;
                 wData <= 400;       
              #50 WE <= 0;
                  rA <= 3;
                  rB <= 4;   
    end
endmodule

