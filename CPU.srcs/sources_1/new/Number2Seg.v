`timescale 1ns / 1ps


//根据data的值(0-9)确定显示数码管相应的段数
module Number2Seg(data,SEG);
    input [31:0] data;
    output reg[7:0]SEG;
    
    always begin
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
        10:SEG = 8'b10001000;          //display 'A'
        11:SEG = 8'b11100000;          //display 'b'
        12:SEG = 8'b10110001;          //display 'C'
        13:SEG = 8'b11000010;          //display 'd'
        14:SEG = 8'b10110000;          //display 'E'
        15:SEG = 8'b10111000;          //display 'F'
         default :SEG <= 'b11111111;
     endcase
 end
endmodule
