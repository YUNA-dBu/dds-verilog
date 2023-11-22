`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:46:46 09/14/2022
// Design Name:   dds
// Module Name:   C:/Users/Sky123.org/dds/dds/dds_test.v
// Project Name:  dds
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dds
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dds_test;

	// Inputs
	reg [2:0] note_bin;
	reg clk;
	reg rst;

	// Outputs
	wire divide_clk;
	wire [31:0] cnt;
	wire real_clk;

	// Instantiate the Unit Under Test (UUT)
	dds uut (
	.note_bin(note_bin), 
		.clk(clk), 
		.rst(rst), 
		.divide_clk(divide_clk), 
		.cnt(cnt),
		.real_clk(real_clk)
	);

	initial begin
		// Initialize Inputs
		note_bin = 0;
		clk = 0;
		rst = 0;
		real_clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		note_bin = 3'b011;
	end

always #250 clk = ~clk;
//always #1000 note_bin = note_bin + 1;
 
endmodule

