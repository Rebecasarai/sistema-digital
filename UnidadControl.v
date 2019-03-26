`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:59 02/28/2019 
// Design Name: 
// Module Name:    UnidadControl 
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
module UnidadControl(
	input clk, reset, xs,
	output reg fin,.....  //Lista de puertos
    );

	parameter [] S0 = ..., 
					 S1 = ...;  //Complete la lista de estados
					
	reg [] current_state,next_state; //Complete el número de bits

	always @(posedge clk,posedge reset)
		//Complete
		
	always @(*)
		begin
			{....} =0;  //Ponemos las salidas a 0
			case(current_state)
				S0:
					if(xs)
						next_state=S1;
			//Complete los estados de acuerdo a la carta ASM
			endcase
		
		end


endmodule
