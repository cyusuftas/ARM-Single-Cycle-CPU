//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com	

module Extend(in,out);
		
	input [11:0] in;
	
	output reg [31:0] out;
	
	always @ (in)
	begin
		out = {20'b0, in};			//zero extend to 32 bit
	end
	
	
endmodule
