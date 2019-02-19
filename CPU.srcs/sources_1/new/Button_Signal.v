`timescale 1ns / 1ps

module Button_Signal(Clk,original_button,new_button);
    input Clk;
    input original_button;
    output reg new_button;

	reg button_temp;

	initial begin
		button_temp <= 0;
	end

	//aaaa
	always @(posedge clk) begin
		button_temp <= original_button;
		new_button <= (~button_temp) & original_button;
	end

endmodule
