`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:31 02/28/2019 
// Design Name: 
// Module Name:    test 
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
module test(
    );

	reg reset,xs,clk;
	wire fin;
	
	SD uut(.reset(reset),.clk(clk),.xs(xs),.fin(fin));
	
	always
		#10 clk = ~clk;
		
	initial
		begin
			//Cree el programa de simulación
			


			$finish;
		end

endmodule
