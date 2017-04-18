`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:10:10 04/18/2017
// Design Name:   clock_divider
// Module Name:   /home/katie/Documents/ECE3700/UART_FPGA/clock_divider_test.v
// Project Name:  UART_FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clock_divider_test;

	// Inputs
	reg clk;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clk(clk), 
		.clk_out(clk_out)
	);
		reg [9:0] counter = 10'b0; 

	

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
	end

	always begin
		#10;
		clk <= ~clk; 
		counter <= counter + 1'b1;
	end
	
	always@(counter)
	begin
		// Add stimulus here
		if(counter == 650)
		begin
			counter <= 10'b0; 
			$display("The value of clk_out is: %b", clk_out); 
		end 
	end
      
endmodule

