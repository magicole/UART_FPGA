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
    output reg clk_out
    );
	 
	 reg [9:0] counter = 10'b0; 

	always@(posedge clk)
	begin	
		if(counter == 650)
		begin
			counter <= 10'b0; 
			clk_out <= ~clk_out; 
		end
		counter <= counter + 1'b1; 
	end

endmodule
