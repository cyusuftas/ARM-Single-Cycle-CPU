//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module mux_2_1 #(parameter W=4) (in0, in1, s0, out);

	input s0;
	//decide lengths of the input and output depending on parameter W 
	input [W-1:0] in0, in1;		
	output reg [W-1:0] out;
	
	//conditional assignment -> s0 selects an input
	always @ (*)
	begin
		if(s0 == 1) begin
			out = in1;
		end else begin
			out = in0;
		end
	end
	//assign out = s0 ? in1 : in0;

endmodule
