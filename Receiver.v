`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:27 04/23/2017 
// Design Name: 
// Module Name:    Receiver 
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
module Receiver(
    input clr,
    input clk,
    input RCV,
    input RCV_ACK,
    output reg RCV_REQ,
    output reg [7:0] RCV_DATA
    );
	 
	reg intnl_clk = 0; 
	reg[2:0] counter = 3'b0; 
	reg[3:0] state = 4'b0; 
	reg[3:0] next_state = 4'b0;  
	parameter count_to = 4; 
	
	always@(posedge clk)
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
		
		case(state)
			1: RCV_DATA[0] = RCV; 
			2: RCV_DATA[1] = RCV; 
			3: RCV_DATA[2] = RCV; 
			4: RCV_DATA[3] = RCV; 
			5: RCV_DATA[4] = RCV; 
			6: RCV_DATA[5] = RCV; 
			7: RCV_DATA[6] = RCV; 
			8:	RCV_DATA[7] = RCV; 
			default: begin
				//RCV_DATA = 0; 
			end
		
		endcase
		
	end
	
	always@(*)
	begin
	
		case(state)
			0: begin
				RCV_REQ = 0; 
				if(!RCV) begin
					next_state = 1; 
				end
				else begin
					next_state = 0; 
				end
			end
			
			1: begin
				RCV_REQ = 0; 
				//RCV_DATA[0] = RCV; 
				next_state = 2; 
			end
			
			2: begin
				RCV_REQ = 0; 
				//RCV_DATA[1] = RCV; 
				next_state = 3; 
			end
			
			3: begin
				RCV_REQ = 0; 
				//RCV_DATA[2] = RCV; 
				next_state = 4; 
			end
			
			4: begin
				RCV_REQ = 0; 
				//RCV_DATA[3] = RCV; 
				next_state = 5; 
				
			end
			
			5: begin
				RCV_REQ = 0; 
				//RCV_DATA[4] = RCV; 
				next_state = 6; 
			end
			
			6: begin
				RCV_REQ = 0; 
				//RCV_DATA[5] = RCV; 
				next_state = 7; 
			end
			
			7: begin
				RCV_REQ = 0; 
				//RCV_DATA[6] = RCV; 
				next_state = 8; 
			end
			
			8: begin
				RCV_REQ = 0; 
				//RCV_DATA[7] = RCV;  
				next_state = 9; 
			end
			
			9: begin
				RCV_REQ = 1; 
				if(RCV_ACK) begin
					next_state = 10; 
				end
				next_state = 9; 
			end
			
			10: begin
				RCV_REQ = 0; 
				if(!RCV_ACK) begin
					next_state = 0; 
				end
				else begin
					next_state = 10; 
				end
			
			end
	
			default: begin
				RCV_REQ = 0; 
				//RCV_DATA = 0; 
				next_state = 0; 
			end
		
		endcase
	
	end
	
	/*Hardest part is calculating how long to wait 
	* Simulate TX line a few lines
	* simulate transmit and see what happens*/

endmodule
