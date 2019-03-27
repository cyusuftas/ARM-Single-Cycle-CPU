//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module two_four_decoder(in0, in1, out0, out1, out2, out3);
	
	input in0, in1;
	output reg out0, out1, out2, out3;
	
	always @(in0 or in1)													//when input change
	begin
		case ( {in1,in0} )												//check inputs and assign proper outputs
			2'b00: {out3, out2, out1, out0} = 4'b0001;
			2'b01: {out3, out2, out1, out0} = 4'b0010;
			2'b10: {out3, out2, out1, out0} = 4'b0100;
			2'b11: {out3, out2, out1, out0} = 4'b1000;
			default: {out3, out2, out1, out0} = 4'bxxxx;
		endcase
	end

endmodule
