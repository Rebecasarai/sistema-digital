`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:34 02/28/2019 
// Design Name: 
// Module Name:    SD 
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
module SD(
	input clk, reset,xs,
	output fin
    );
	wire Ra, Rb, Rc, Rac, Wa, Wb, Wc, Wac, Wt, S, R;//Cables de interconexión entre UC y UD

	//Declare instancias de la UD y UC. Use conexión nombrada

	UnidadControl UC(.clk(clk), .reset(reset), .xs(xs));
	UnidadDatos UD(.clk(clk), .Ra(Ra), .Rb(Rb), .Rc(Rc), .Rac(Rac), .Wa(Wa), .Wb(Wb), .Wc(Wc), .Wac(Wac), .Wt(Wt), .S(S), .R(R)); //Complete la lista de puertos

endmodule
