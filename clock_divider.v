`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:27 04/18/2017 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(
    input clk,
    output reg clk_out = 1'b0
    );
	 
	 reg [9:0] counter = 10'b0; 
	 parameter count_to = 651; 

	always@(posedge clk)
	begin	
		if(counter == count_to)
		begin
			counter <= 10'b0; 
			clk_out <= ~clk_out; 
		end
		else
			counter <= counter + 1'b1; 
	end
		
endmodule
