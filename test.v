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
	
	SD uut (.reset(reset),.clk(clk),.xs(xs));
	
	always
		#50 clk = ~clk;
		
	initial
		begin
		
		// Generación de formas de onda
		$dumpfile("test.vcd");
		$dumpvars(0, test);
		
			{reset,xs,clk}=0;
			
			#5 reset=1;
			#5 reset=0;
			
			xs=1;
			@(posedge clk);//esperamos un flanco de reloj
			xs=0;
			
			repeat(3) @(posedge clk)
			

			$finish;
		end

endmodule
