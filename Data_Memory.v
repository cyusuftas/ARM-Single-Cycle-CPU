//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Data_Memory(clk, A, WD, MemWrite, out);
	
	input clk, MemWrite;
	input [31:0] A;
	input [31:0] WD;
	
	output reg [31:0] out;
	
	reg [7:0] data_mem [0:255];
	
	integer i;
	
	//initially fill memory
	initial begin
		data_mem[0] = 8'b0;
		data_mem[1] = 8'b0;
		data_mem[2] = 8'b0;
		data_mem[3] = 8'b0;
		data_mem[4] = 8'b1;
		data_mem[5] = 8'b0;
		data_mem[6] = 8'b0;
		data_mem[7] = 8'b0;
		data_mem[8] = 8'b01;
		data_mem[9] = 8'b0;
		data_mem[10] = 8'b0;
		data_mem[11] = 8'b0;
		data_mem[12] = 8'b11;
		data_mem[13] = 8'b0;
		data_mem[14] = 8'b0;
		data_mem[15] = 8'b0;
 		for(i=16; i<256; i=i+1) begin
			data_mem[i] = i;
		end
	end
	
	//data is written sequentially
	always @(posedge clk)
	begin
		if(MemWrite) begin
			{data_mem[A+3],data_mem[A+2],data_mem[A+1],data_mem[A]} <= WD;
		end
	end
	
	//data can be read at any time 
	always @(A)
	begin
		out = {data_mem[A+3],data_mem[A+2],data_mem[A+1],data_mem[A]};
	end

endmodule
