`timescale 1ns / 1ps

module tb_mem_data( );
    reg Clk;
    reg Rst;
    reg Sel;
    reg  MemWrite;
    reg [31:0] Addr;
    reg [31:0]  Datain;
    wire [31:0] Dataout;
    Mem_Data T3(Clk,Addr,Rst, Datain,MemWrite,Sel,Dataout);
    
    integer i;
    integer j;
    
    initial begin
        Clk<=1;
        MemWrite<=1;
        Addr <= 0;
        Datain<=0;  
        Rst<=0;  
        Sel<=15;
        i <= 0;
        j <= 0;
    end
    
    always # 10 begin
        Clk <= ~ Clk;
        if(i == 5) begin
            Rst <= 1;
        end
        else begin
            Addr <= i;
            Datain <= j;
            i <= i + 1;
            j <= j + 1;
        end
    end
endmodule

