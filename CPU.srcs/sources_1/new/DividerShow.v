`timescale 1ns / 1ps

module DividerShow(clk,CLK);
    input clk;
    output reg CLK;
    
    reg[32:0] N = 50_000;      // 1Hz��ʱ��,N=fclk/fclk_N
    reg [31:0] counter;             /* ������������ͨ������ʵ�ַ�Ƶ������������0������(N/2-1)ʱ�����ʱ�ӷ�ת������������ */
    
    initial begin
        CLK <= 0;
        counter <= 0;
    end
    always @(posedge clk)  begin    // ʱ��������
        if(counter== N) begin
            CLK <= ~CLK;
            counter <=0;
        end
       else begin
           counter <= counter+1;
       end
    end 
endmodule
