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
	 reg [9:0] counter = 10'b0; //couter capable of holding up to 651
	 parameter count_to = 651; //651 because 1302/2 = 651 and we get 1302 by dividing our 100Mhz clock by slow 76.8kHz clock

	//Sequential block
	always@(posedge clk)
	begin	
		if(counter == count_to) //count_to is half because half of clock cycles are high and half are low
		begin
			counter <= 10'b0; 
			clk_out <= ~clk_out;
		end
		else
			counter <= counter + 1'b1; //haven't reached our count, so just increment our slow clock counter
	end
endmodule
