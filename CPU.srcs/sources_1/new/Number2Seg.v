`timescale 1ns / 1ps


//根据data的�??(0-9)确定显示数码管相应的段数
module Number2Seg(data,SEG);
    input [7:0] data;
    output reg[7:0]SEG;
    
    always @(data)begin
     case(data)
         0:SEG <= 'b11000000;
         1:SEG <= 'b11111001;
         2:SEG <= 'b10100100;
         3:SEG <= 'b10110000;
         4:SEG <= 'b10011001;
         5:SEG <= 'b10010010;
         6:SEG <= 'b10000010;
         7:SEG <= 'b11111000;
         8:SEG <= 'b10000000;
         9:SEG <= 'b10011000;
         10:SEG = 8'b10001000;
         11:SEG = 8'b10000011;
         12:SEG = 8'b11000110;
         13:SEG = 8'b10100001;
         14:SEG = 8'b10000110;
         15:SEG = 8'b10001110;

         default :SEG <= 'b11111111;
     endcase
 end
endmodule
