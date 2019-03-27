//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module mux_4_1 #(parameter W=4) (s0,s1,in0,in1,in2,in3,out);
	
	//select
	input s0,s1;
	
	//input and output size is dependent on parameter W
	input [W-1:0] in0,in1,in2,in3;
	output reg [W-1:0] out;
	
	//if anything changes
	always @ (*) 
	begin
		case({s1,s0})					//consider s1 and s0 select inputs to choose output
			2'b00: out = in0;
			2'b01: out = in1;
			2'b10: out = in2;
			2'b11: out = in3;
			default: out = 0;
		endcase
	end

endmodule
