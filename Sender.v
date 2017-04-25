`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:50 04/22/2017 
// Design Name: 
// Module Name:    Sender 
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
module Sender(
    input clr,
    input XMT_REQ,
    input [7:0] XMT_DATA,
    input clk,
    output reg XMT_ACK,
    output reg XMT
    );

	reg intnl_clk = 0; 
	reg[1:0] counter = 0; 
	reg[3:0] state = 4'b0; 
	reg[3:0] next_state = 4'b0;  
	reg[7:0] temp_data = 7'b0; 
	parameter count_to = 3; 
	
	//Sequential block for setting up registers
	always@(posedge clk) 
	begin
		//Clear, reset the state
		if(clr) begin
			state <= 0; 
			intnl_clk <= 0; 
		end
		
		//Reset counter to zero, invert our internal clock and 
		//if it's low move to the next state in the state machine
		//below
		if(counter == count_to) begin
			counter <= 1'b0; 
			intnl_clk <= ~intnl_clk; 
			if(intnl_clk == 0) begin
				state <= next_state; 
			end
		end 
		//Haven't reached count_to limit, just increment counter
		else begin
			counter <= counter + 1'b1; 
		end
	end
	
	//Combinational block sets up the state machine	
	always@(*) begin
		XMT <= 1;
		case(state)
			0: begin
				//If XMT_REQ is high, we're about to send something go to the next state and set XMT low
				if(XMT_REQ)begin
					temp_data = XMT_DATA;
					next_state = 1;
					XMT <= 0;
				end 
				else begin
					next_state = 0;
				end
				XMT_ACK = 0;
				//XMT = 0;
			end
			1: begin
				//Push temp_data bit 0 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[0];
				next_state = 2;
				XMT_ACK = 0;
			end
			2: begin
				//Push temp_data bit 1 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[1];
				next_state = 3;
				XMT_ACK = 0;
			end
			3: begin
				//Push temp_data bit 2 out on XMT line 
				temp_data = XMT_DATA;
				XMT <= temp_data[2];
				next_state = 4;
				XMT_ACK = 0;
			end
			4: begin
				//Push temp_data bit 3 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[3];
				next_state = 5;
				XMT_ACK = 0;
			end
			5: begin
				//Push temp_data bit 4 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[4];
				next_state = 6;
				XMT_ACK = 0;
			end
			6: begin
				//Push temp_data bit 5 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[5];
				next_state = 7;
				XMT_ACK = 0;
			end
			7: begin
				//Push temp_data bit 6 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[6];
				next_state = 8;
				XMT_ACK = 0;
			end
			8: begin
				//Push temp_data bit 7 out on XMT line
				temp_data = XMT_DATA;
				XMT <= temp_data[7];
				next_state = 9;
				XMT_ACK = 0;
			end
			9: begin
				//Bring XMT_ACK high so receiver knows that you're done sending
				temp_data = XMT_DATA;
				XMT_ACK = 1;
				//Check that XMT_REQ has been brought low. When it has, go to the next state which brings XMT_ACK low and then goes back to the starting state
				if(!XMT_REQ)begin
					next_state = 10;
				end else begin
					next_state = 9;
				end
				
			end
			10:begin
				//Set XMT_ACK low and next_state back to start state
				XMT_ACK = 0;
				next_state = 0;
			end 
			default: begin
				//default state just handles implied latches
				next_state = 0;
				temp_data = 0;
				XMT_ACK = 0;
			end
		endcase
	end

endmodule
