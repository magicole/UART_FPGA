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
	reg[2:0] counter = 3'b0; 
	reg[3:0] state = 4'b0; 
	reg[3:0] next_state = 4'b0;  
	reg[7:0] temp_data = 7'b0; 
	parameter count_to = 4; 
	
	always@(posedge clk) //monitor clear maybe? 
	begin
		if(clr)
		begin
			state <= 0; 
			intnl_clk <= 0; 
		end
		if(counter == count_to)
		begin
			counter <= 1'b0; 
			intnl_clk <= ~intnl_clk; 
			if(intnl_clk == 0)
			begin
				state <= next_state; 
			end
		end
		else
		begin
			counter <= counter + 1'b1; 
		end
	end
	
	//Combinational block sets up the state machine	
	always@(*)
	begin
		//XMT_ACK = 0;
		case(state)
			0: begin
				if(XMT_REQ)begin
					temp_data = XMT_DATA;
					next_state = 1;
				end 
				else begin
					next_state = 0;
				end
				XMT_ACK = 0;
				XMT = 0;
			end //if XMT_Req line is high there's something to send - temp_data = XMT_Data
			1: begin
				temp_data = XMT_DATA;
				XMT = temp_data[0];
				next_state = 2;
				XMT_ACK = 0;
			end//Push temp_data bit 0 out on XMT line
			2: begin
				temp_data = XMT_DATA;
				XMT = temp_data[1];
				next_state = 3;
				XMT_ACK = 0;
			end//Push temp_data bit 1 out on XMT line
			3: begin
				temp_data = XMT_DATA;
				XMT = temp_data[2];
				next_state = 4;
				XMT_ACK = 0;
			end//Push temp_data bit 2 out on XMT line 
			4: begin
				temp_data = XMT_DATA;
				XMT = temp_data[3];
				next_state = 5;
				XMT_ACK = 0;
			end//Push temp_data bit 3 out on XMT line
			5: begin
				temp_data = XMT_DATA;
				XMT = temp_data[4];
				next_state = 6;
				XMT_ACK = 0;
			end//Push temp_data bit 4 out on XMT line
			6: begin
				temp_data = XMT_DATA;
				XMT = temp_data[5];
				next_state = 7;
				XMT_ACK = 0;
			end//Push temp_data bit 5 out on XMT line
			7: begin
				temp_data = XMT_DATA;
				XMT = temp_data[6];
				next_state = 8;
				XMT_ACK = 0;
			end//Push temp_data bit 6 out on XMT line
			8: begin
				temp_data = XMT_DATA;
				XMT = temp_data[7];
				next_state = 9;
				XMT_ACK = 0;
			end//Push temp_data bit 7 out on XMT line - note this is the parity bit which is used for error checking, it will always be zero in our system
			9: begin
				temp_data = XMT_DATA;
				XMT_ACK = 1;
				if(!XMT_REQ)begin
					next_state = 10;
				end else begin
					next_state = 9;
				end
				XMT = 0;
			end//if XMT_ACK (keep checking this until you get the ACK) 
			10:begin
				XMT_ACK = 0;
				next_state = 0;
				XMT = 0;
			end //if !XMT_REQ - XMT_ACK = 0
			default: begin
				next_state = 0;
				temp_data = 0;
				XMT_ACK = 0;
				XMT = 0;
			end
			
		endcase
	end
	/*always@(posedge intnl_clk)
	begin
		state = 
	end*/

endmodule
