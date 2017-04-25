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
	 
	reg intnl_clk = 1; 
	reg[1:0] counter = 3; 
	reg[3:0] state = 4'b0; 
	reg[3:0] next_state = 4'b0;  
	parameter count_to = 3; 
	
	//Sequential logic block
	always@(posedge clk)
	begin
		//If the clear button is pressed, reset the LED's, the state machine, and the clock
		if(clr)
		begin
			state <= 0; 
			intnl_clk <= 0; 
			RCV_DATA = 8'b0;
		end
		//counter made it to count to invert the clok
		if(counter == count_to)
		begin
			counter <= 1'b0; 
			intnl_clk <= ~intnl_clk; 
			//If intnl_clk is low, go to the next state below
			if(intnl_clk == 0)
			begin
				state <= next_state; 
			end
		end
		//Counter hasn't made it to its limit just increment it 
		else
		begin
			counter <= counter + 1'b1; 
		end
		
		//Assign receive in the sequential block rather than in the combinational block to avoid implied latches
		case(state)
			1: RCV_DATA[0] = RCV; 
			2: RCV_DATA[1] = RCV; 
			3: RCV_DATA[2] = RCV; 
			4: RCV_DATA[3] = RCV; 
			5: RCV_DATA[4] = RCV; 
			6: RCV_DATA[5] = RCV; 
			7: RCV_DATA[6] = RCV; 
			8:	RCV_DATA[7] = RCV; 
		endcase
		
	end
	
	//Combinational logic block
	always@(*)
	begin
	
		case(state)
			0: begin
				RCV_REQ = 0; 
				//RCV line is low, we're about to receive data go to the next state
				if(RCV == 0) begin
					next_state = 1; 
				end
				//not about to receive, just chill
				else begin
					next_state = 0; 
				end
			end
			
			1: begin
				RCV_REQ = 0; //received bit 0 (seq block)
				next_state = 2; 
			end
			
			2: begin
				RCV_REQ = 0; //received bit 1 (seq block)
				next_state = 3; 
			end
			
			3: begin
				RCV_REQ = 0; //received bit 2 (seq block)
				next_state = 4; 
			end
			
			4: begin
				RCV_REQ = 0; //received bit 3 (seq block) 
				next_state = 5; 
				
			end
			
			5: begin
				RCV_REQ = 0; //received bit 4 (seq block) 
				next_state = 6; 
			end
			
			6: begin
				RCV_REQ = 0; //received bit 5 (seq block) 
				next_state = 7; 
			end
			
			7: begin
				RCV_REQ = 0; //received bit 6 (seq block) 
				next_state = 8; 
			end
			
			8: begin
				RCV_REQ = 0; //received bit 7 (seq block) 
				next_state = 9; 
			end
			
			9: begin
				RCV_REQ = 1; //Set RCV_REQ b/c we're done receiving
				//Check for RCV_ACK to indicate we're really done, then go to the next state to reset it
				if(RCV_ACK) begin
					next_state = 10; 
				end
				else begin
					next_state = 9; 
				end
			end
			
			10: begin
				//We reset RCV_REQ
				RCV_REQ = 0; 
				//RCV_ACK is now low we can go back to beginning state
				if(!RCV_ACK) begin
					next_state = 0; 
				end
				else begin
					next_state = 10; 
				end
			
			end
	
			default: begin
				RCV_REQ = 0; 
				next_state = 0; 
			end
		
		endcase
	
	end
	
	/*Hardest part is calculating how long to wait 
	* Simulate TX line a few lines
	* simulate transmit and see what happens*/

endmodule
