`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:32 02/28/2019 
// Design Name: 
// Module Name:    SistemaDigital 
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
module UnidadDatos #(parameter n=8)(
	input clk, Ra, Rb, Rc, Rac, Wa, Wb, Wc, Wac, Wt, S, R ); //Complete la lista de puertos

	wire [n-1:0] bus1, bus2, bus3;  //Declare los buses de interconexión
	registro1 #(n,10) A(.clk(clk), .W(Wa), .R(Ra), .bus(bus1)); 			//Complete la lista de puertos usando conexión nombrada
	registro1 #(n,10) B(.clk(clk), .W(Wb), .R(Rb), .bus(bus1));
	registro1 #(n,10) C(.clk(clk), .W(Wc), .R(Rc), .bus(bus1));
	registroAC #(n,10) AC(.clk(clk), .W(Wac), .R(Rac), .busin(bus3), .busout(bus1));
	registroT #(n,10) T(.clk(clk), .W(Wac), .busin(bus1), .busout(bus2));

	//Complete la unidad de datos

endmodule


module registro1 #(parameter n=8,valor = 0)(
	input W,R,clk,  //complete la lista de puertos
	inout [n-1:0] bus
);
	//El primer argumento de parameter, o sea, n, determina
	//el número de bits o tamaño de los registros y buses de
	//la unidad de datos. Por defecto será de 8. El segundo 
	//parámetro, valor, se usa para simulación y permite cargar
	//el registros con un número inicial. Esto se consigue con
	//el bloque initial.
	
	reg [n-1:0] q;
	
	always @(posedge clk)
		//Complete el bloque initial

	if (W)
		q <= bus;
		
	initial
		q<=valor;
	
	assign bus = R ? q: 'bz; //Complete la lectura condicional

endmodule

//Complete la lista de módulos que sean necesarios para
//la unidad de datos.



module registroAC #(parameter n=8,valor = 0)(
	input W,R,clk,  //complete la lista de puertos
	input [n-1:0] busin,
	output [n-1:0] busout

);
	//El primer argumento de parameter, o sea, n, determina
	//el número de bits o tamaño de los registros y buses de
	//la unidad de datos. Por defecto será de 8. El segundo 
	//parámetro, valor, se usa para simulación y permite cargar
	//el registros con un número inicial. Esto se consigue con
	//el bloque initial.
	
	reg [n-1:0] q;
	
	always @(posedge clk)
		//Complete el bloque initial

	if (W)
		q <= busin;
		
	initial
		q<=valor;
	
	assign busout = R ? q: 'bz; //Complete la lectura condicional

endmodule


module registroT #(parameter n=8,valor = 0)(
	input W,clk,  
	input [n-1:0] busin,
	output [n-1:0] busout
);
	//El primer argumento de parameter, o sea, n, determina
	//el número de bits o tamaño de los registros y buses de
	//la unidad de datos. Por defecto será de 8. El segundo 
	//parámetro, valor, se usa para simulación y permite cargar
	//el registros con un número inicial. Esto se consigue con
	//el bloque initial.
	
	reg [n-1:0] q;
	
	always @(posedge clk)
		//Complete el bloque initial

	if (W)
		q <= busin;
		
	initial
		q<=valor;
	
	assign busout = q; 

endmodule



module SD #(parameter n=8)(
	input xs, clk, reset
	); 

	wire Ra, Rb, Rc, Rac, Wa, Wb, Wc, Wac, Wt, S, R;

	UnidadControl unidadControl(.clk(clk), .reset(reset), .xs(xs));
	UnidadDatos unidadDatos(.clk(clk), .Ra(Ra), .Rb(Rb), .Rc(Rc), .Rac(Rac), .Wa(Wa), .Wb(Wb), .Wc(Wc), .Wac(Wac), .Wt(Wt), .S(S), .R(R)); //Complete la lista de puertos

endmodule


module alu #(parameter n=8)(
	input s, r,
	input [n-1:0] a, b,
	output reg [n-1:0] out
);

	always @(*)
	case({s,r})
	2'b10:
		out = a+b;
	2'b01:
		out = a-b;
	default: out = 0;

	endcase

endmodule



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
