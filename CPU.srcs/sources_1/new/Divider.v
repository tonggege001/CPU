`timescale 1ns / 1ps

module Divider(clk,CLK,Freq);
    input clk;
    output reg CLK;
    input [1:0] Freq;
    
    reg[32:0] N = 50_000_00;      // 1Hz的时钟,N=fclk/fclk_N
    reg [31:0] counter;             /* 计数器变量，通过计数实现分频。当计数器从0计数到(N/2-1)时，输出时钟翻转，计数器清零 */
    
    initial begin
        CLK <= 0;
        counter <= 0;
    end
    always @(posedge clk)  begin    // 时钟上升沿
        if(counter >= (N + (N * Freq * Freq )))
            begin
            CLK <= ~CLK;
            counter <=0;
            end
       else begin
           counter <= counter+1;
       end
    end 
endmodule
