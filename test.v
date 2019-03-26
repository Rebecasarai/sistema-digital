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
<<<<<<< HEAD
			{reset,xs,clk,fin}=0;
			
			#5 reset=1;
			#5 reset=0;
			
			xs=1;
			@(posedge clk);//esperamos un flanco de reloj
			xs=0;
			
			repeat(3) @(posedge clk)
			
=======
			//Cree el programa de simulación
			


>>>>>>> 3a01a05009be5fe6fa84dfac7dc065c65ac3a41d
			$finish;
		end

endmodule
