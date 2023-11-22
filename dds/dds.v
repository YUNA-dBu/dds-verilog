`timescale 1ns / 1ps

module dds(
    input	[2:0] note_bin,
    input	clk,
    input	rst,
	output	reg [31:0] cnt,
	output	divide_clk//,
	//output  reg real_clk
    );

initial cnt = 32'h0000_0000;
//initial real_clk = 1'b0;

reg [23:0] K_array [0:7];
initial begin 
//  2.15M
	K_array[0]=24'd0; 
	K_array[1]=24'd522627;
	K_array[2]=24'd586652;
	K_array[3]=24'd658488;
	K_array[4]=24'd697642;
	K_array[5]=24'd783062;
	K_array[6]=24'd878970;
	K_array[7]=24'd986603;

//  2.2M
//	K_array[0]=24'd0; 
//	K_array[1]=24'd510750;
//	K_array[2]=24'd573320;
//	K_array[3]=24'd643523;
//	K_array[4]=24'd681787;
//	K_array[5]=24'd765266;
//	K_array[6]=24'd858994;
//	K_array[7]=24'd964181;

//  2.25M
//	K_array[0]=24'd0; 
//	K_array[1]=24'd499349;
//	K_array[2]=24'd560579;
//	K_array[3]=24'd629222;
//	K_array[4]=24'd666636;
//	K_array[5]=24'd748259;
//	K_array[6]=24'd839904;
//	K_array[7]=24'd942754;
	
//	2.1M // 2.0M
//	K_array[0]=24'd0; 
//	K_array[1]=24'd535071;//561824;//488543;
//	K_array[2]=24'd600620;//630651;//548392;
//	K_array[3]=24'd674166;//707875;//615543;
//	K_array[4]=24'd714253;//749965;//652144;
//	K_array[5]=24'd801706;//841792;//731993;
//	K_array[6]=24'd899897;//944892;//821645;
//	K_array[7]=24'd1010094;//1060599;//922260;
end	

//reg [2:0] note_bin [0:41]={1,1,5,5,6,6,5,4,4,3,3,2,2,1,5,5,4,4,3,3,2,5,5,4,4,3,3,2,1,1,5,5,6,6,5,4,4,3,3,2,2,1};
//reg [6:0] pnt;
//reg [15:0] cnt2;

//always@(posedge clk)
//begin 
//	cnt2 = cnt2 + 1'b1;
//	if (cnt2 == 1000000)
//	begin
//		cnt2 = 0;
//		if (pnt==42) 
//			pnt = 0;
//		else 
//			pnt = pnt + 1'b1;
//	end
			
//end

always@(posedge clk or posedge rst)
begin
    if (rst)
	begin 
        cnt <= 32'h0000_0000;
	end
    else begin 
        cnt <= cnt + K_array[note_bin];
	end

end

assign  divide_clk = note_bin ? cnt[31] : 0;

endmodule
