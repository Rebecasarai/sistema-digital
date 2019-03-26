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
	output reg fin,Wa,Wb,Wc,Wt,Wac,Ra,Rb,Rc,Rac,S,R  //Lista de puertos
    );

	parameter [3:0] S0 =4'd0,
					S1 =4'd1,
					S2 =4'd2,
					S3 =4'd3,
					S4 =4'd4,
					S5 =4'd5,
					S6 =4'd6,
					S7 =4'd7,
					S8 =4'd8,
					S9 =4'd9,
					S10=4'd10, 
					S11=4'd11;
					  //Complete la lista de estados
					
	reg [2:0] current_state,next_state; //Complete el número de bits

	always @(posedge clk,posedge reset)
		if(reset)
			current_state<=S0;
		else
			current_state<=next_state;
		
	always @(*)
		begin
			{fin,Wa,Wb,Wc,Wt,Wac,Ra,Rb,Rc,Rac,S,R} =0;  //Ponemos las salidas a 0
			case(current_state)
				S0:
					if(xs)
						next_state=S1;
					else
						next_state=S0;
				S1:
				begin
					{Ra, Wt}=1;		//T<-A
					next_state=S2;
				end
				S2:
				begin
					{Ra,S,Wac}=1;		//AC<-T+A
					next_state=S3;
				end
				S3:
				begin
					{Wc,Rac}=1;		//C<-AC
					next_state=S4;
				end
				S4:
				begin 
					{Rb,Wt}=1;		//T<-B
					next_state=S5;
				end
				S5:
				begin
					{Wac,Rb,S}=1;		//AC<-T+B
					next_state=S6;
				end
				S6:
				begin 
					{Rac,Wa}=1;		//A<-AC
					next_state=S7;
					
				end
				S7:
				begin
					{Wt,Rc}=1;		//B<-C
					next_state=S8;
				end
				S8:
				begin
					{Wt,Rc}=1;		//T<-C
					next_state=S9;
				end
				S9:
				begin
					{Wac,Ra,S}=1;		//AC<-T+A
					next_state=S10;
				end
				S10:
				begin
					{Rac,Wc}=1;		//C<-AC
					next_state=S11;
				end
				S11:
				begin 
					fin=1;
					next_state=S0; 			//Al activarse fin, volveremos al estado inicial
				end
			//Complete los estados de acuerdo a la carta ASM
			endcase
		
		end


endmodule
