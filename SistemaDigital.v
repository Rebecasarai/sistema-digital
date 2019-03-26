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
	output [n-1:0] busout,
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


module alu #(parameter n=8){
	input s, r,
	input [n-1:0] a, b,
	output reg [n-1:0] out,
};
	always(*)
	case({s,r})
	2'b10:
		out = a+b;
	2'b01:
		out = a-b;
	default: out = 0;

	endcase

endmodule

