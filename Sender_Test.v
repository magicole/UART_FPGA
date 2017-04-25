`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:00 04/24/2017
// Design Name:   Sender
// Module Name:   /home/katie/Documents/ECE3700/UART_FPGA/Sender_Test.v
// Project Name:  UART_FPGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sender_Test;

	// Inputs
	reg clr;
	reg XMT_REQ;
	reg [7:0] XMT_DATA;
	reg clk;

	// Outputs
	wire XMT_ACK;
	wire XMT;

	// Instantiate the Unit Under Test (UUT)
	Sender uut (
		.clr(clr), 
		.XMT_REQ(XMT_REQ), 
		.XMT_DATA(XMT_DATA), 
		.clk(clk), 
		.XMT_ACK(XMT_ACK), 
		.XMT(XMT)
	);

	reg fast_clk; 
	reg [3:0] state = 4'b0;
	reg [3:0] next_state = 4'b0;

	initial fast_clk = 0; 
	always #10 fast_clk = ~fast_clk; 

	
	initial begin
		// Initialize Inputs
		clr = 0;
		XMT_REQ = 0;
		XMT_DATA = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	reg [9:0] counter = 10'b0; 
	parameter count_to = 651; 
	
	reg [1:0] slow_counter = 2'b0;
	parameter slow_count_to = 3;
	reg slow_clk = 0;

	//Sequential logic block for our 76.8khz clk
	always@(posedge fast_clk)
	begin	
		//Set up slow clock
		if(counter == count_to)
		begin
			counter <= 10'b0; 
			clk <= ~clk;
		end
		else
			counter <= counter + 1'b1; 
	end
	
	//Sequential logic block for our 9600 baud 'slow clk' 
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
	
	//Combinational block for sending data (the character 'a')
	always@(*) 
	begin
		XMT_DATA <= 8'b01100001;
		XMT_REQ <= 1;
		case(state)
			0:begin
				XMT_REQ <= 0;
				next_state = 1;
			end
			1:begin
				XMT_REQ <= 1;
				next_state = 2;
			end
			2:begin
				if(XMT == 1)begin
					$display("First bit transmit success!"); 
				end
				next_state = 3;
			end
			3:begin	
				if(XMT == 0)begin
					$display("Second bit transmit success!"); 
				end
				next_state = 4;
			end
			4:begin
				if(XMT == 0)begin
					$display("Third bit transmit success!"); 
				end
				next_state = 5;
			end
			5:begin
				if(XMT == 0)begin
					$display("Fourth bit transmit success!"); 
				end
				next_state = 6;
			end
			6:begin
				if(XMT == 0)begin
					$display("Fifth bit transmit success!"); 
				end
				next_state = 7;
			end
			7:begin
				if(XMT == 1)begin
					$display("Sixth bit transmit success!"); 
				end
				next_state = 8;
			end
			8:begin
				if(XMT == 1)begin
					$display("Seventh bit transmit success!"); 
				end
				next_state = 9;
			end
			9:begin
				if(XMT == 0)begin
					$display("Eighth bit transmit success!"); 
				end
				next_state = 10;
			end
			10:begin
				if(XMT_ACK == 1) begin
					XMT_REQ <= 0; 
				end
				next_state = 0;
			end
		endcase
	end
	
	
      
      
endmodule

