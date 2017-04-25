`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:19 04/24/2017
// Design Name:   Receiver
// Module Name:   /home/katie/Documents/ECE3700/UART_FPGA/Receiver_Test.v
// Project Name:  UART_FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Receiver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Receiver_Test;

	// Inputs
	reg clr;
	reg clk;
	reg RCV;
	reg RCV_ACK;

	// Outputs
	wire RCV_REQ;
	wire [7:0] RCV_DATA;

	// Instantiate the Unit Under Test (UUT)
	Receiver uut (
		.clr(clr), 
		.clk(clk), 
		.RCV(RCV), 
		.RCV_ACK(RCV_ACK), 
		.RCV_REQ(RCV_REQ), 
		.RCV_DATA(RCV_DATA)
	);
	reg fast_clk; 
	reg [3:0] state = 4'b0;
	reg [3:0] next_state = 4'b0;

	initial fast_clk = 0; 
	always #10 fast_clk = ~fast_clk; 

	initial begin
		// Initialize Inputs
		clr = 0;
		clk = 0;
		RCV = 0;
		RCV_ACK = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		
	end
	
	
	reg [9:0] counter = 10'b0; 
	parameter count_to = 651; 
	
	reg [1:0] slow_counter = 2'b0;
	parameter slow_count_to = 3;
	reg slow_clk = 0;

	//Sets up the registers
	always@(posedge fast_clk)
	begin	
		if(counter == count_to)
		begin
			counter <= 10'b0; 
			clk <= ~clk;
		end
		else
			counter <= counter + 1'b1; 
	end
	
	always@(posedge clk)
	begin
		if(slow_counter == slow_count_to)
		begin
			slow_counter <= 3'b0;
			slow_clk <= ~slow_clk;
			if(!slow_clk)begin
				state = next_state;
			end
		end
		else
		begin
			slow_counter <= slow_counter +1'b1;
		end
	end
	
	always@(*) 
	begin
		RCV <= 1;
		case(state)
			0:begin
				RCV <= 1;
				next_state = 1;
			end
			1:begin
				RCV <= 0;
				next_state = 2;
			end
			2:begin
				RCV <= 1;
				next_state = 3;
			end
			3:begin	
				RCV <= 0;
				next_state = 4;
			end
			4:begin
				RCV <= 0;
				next_state = 5;
			end
			5:begin
				RCV <= 0;
				next_state = 6;
			end
			6:begin
				RCV <= 0;
				next_state = 7;
			end
			7:begin
				RCV <= 1;
				next_state = 8;
			end
			8:begin
				RCV <= 1;
				next_state = 9;
			end
			9:begin
				RCV <= 0;
				next_state = 10;
			end
			10:begin
				RCV <= 1;
				RCV_ACK <= 1; 
				next_state = 11;
				$display(RCV_DATA);
			end
			11: begin
				if(RCV_REQ == 0) begin
					RCV_ACK = 0; 
					next_state = 0; 
				end
				else begin
					RCV_ACK = 1; 
					next_state = 11; 
				end
			end
		endcase
	end
	
	
      
endmodule

