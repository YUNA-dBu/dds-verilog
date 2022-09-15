`timescale 1ns / 1ps

module dds(
    input	[2:0] note_bin,
    input	clk,
    input	rst,
	output	reg [31:0] cnt,
	output	divide_clk
    );

initial cnt = 32'h0000_0000;

reg [24:0] K_array [0:7];
initial begin 
	K_array[0]=24'd0;
	K_array[1]=24'd561824;
	K_array[2]=24'd630651;
	K_array[3]=24'd707875;
	K_array[4]=24'd749965;
	K_array[5]=24'd841792;
	K_array[6]=24'd944892;
	K_array[7]=24'd1060599;
end	

reg cnt_equal;

always@(posedge clk or negedge rst)
begin
    if(!rst) begin 
        cnt <= 0;
		cnt_equal <= 0;
	end
    else begin 
        cnt <= cnt + K_array[note_bin];
		cnt_equal <= cnt[31];
	end
end

assign  divide_clk = cnt_equal;

endmodule
