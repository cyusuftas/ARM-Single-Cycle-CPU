//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Register_File #(parameter W=32) (clk, RegWrite, A1, A2, A3, WD3, R15_in, RD1, RD2, out0, out1, out2);
	
	//inputs
	input clk, RegWrite;
	input [3:0] A1, A2, A3;
	input [W-1:0] WD3, R15_in;
	
	//outputs
	output [W-1:0] RD1,RD2;
	output wire [W-1:0] out0, out1, out2;
	
	
	//	//internal wires
	wire [15:0] write_enable;
	wire [15:0] decoder_out;
	wire [W-1:0] out3,out4, out5, out6, out7,out8, out9, out10, out11, out12, out13, out14, out15;
	
	
	//structural components
	decoder4_16 d1(.in0(A3[0]), .in1(A3[1]), .in2(A3[2]), .in3(A3[3]), .out0(decoder_out[0]), .out1(decoder_out[1]), .out2(decoder_out[2]), .out3(decoder_out[3]),
																							 .out4(decoder_out[4]), .out5(decoder_out[5]), .out6(decoder_out[6]), .out7(decoder_out[7]),
																							 .out8(decoder_out[8]), .out9(decoder_out[9]), .out10(decoder_out[10]), .out11(decoder_out[11]),
																							 .out12(decoder_out[12]), .out13(decoder_out[13]), .out14(decoder_out[14]), .out15(decoder_out[15]));
	
	and a0(write_enable[0], RegWrite, decoder_out[0]);
	and a1(write_enable[1], RegWrite, decoder_out[1]);
	and a2(write_enable[2], RegWrite, decoder_out[2]);
	and a3(write_enable[3], RegWrite, decoder_out[3]);
	and a4(write_enable[4], RegWrite, decoder_out[4]);
	and a5(write_enable[5], RegWrite, decoder_out[5]);
	and a6(write_enable[6], RegWrite, decoder_out[6]);
	and a7(write_enable[7], RegWrite, decoder_out[7]);
	and a8(write_enable[8], RegWrite, decoder_out[8]);
	and a9(write_enable[9], RegWrite, decoder_out[9]);
	and a10(write_enable[10], RegWrite, decoder_out[10]);
	and a11(write_enable[11], RegWrite, decoder_out[11]);
	and a12(write_enable[12], RegWrite, decoder_out[12]);
	and a13(write_enable[13], RegWrite, decoder_out[13]);
	and a14(write_enable[14], RegWrite, decoder_out[14]);
	and a15(write_enable[15], RegWrite, decoder_out[15]);
	
	Reg_w_Reset_and_WE #(W) R0(clk, 0, write_enable[0], WD3, out0);
	Reg_w_Reset_and_WE #(W) R1(clk, 0, write_enable[1], WD3, out1);
	Reg_w_Reset_and_WE #(W) R2(clk, 0, write_enable[2], WD3, out2);
	Reg_w_Reset_and_WE #(W) R3(clk, 0, write_enable[3], WD3, out3);
	Reg_w_Reset_and_WE #(W) R4(clk, 0, write_enable[4], WD3, out4);
	Reg_w_Reset_and_WE #(W) R5(clk, 0, write_enable[5], WD3, out5);
	Reg_w_Reset_and_WE #(W) R6(clk, 0, write_enable[6], WD3, out6);
	Reg_w_Reset_and_WE #(W) R7(clk, 0, write_enable[7], WD3, out7);
	Reg_w_Reset_and_WE #(W) R8(clk, 0, write_enable[8], WD3, out8);
	Reg_w_Reset_and_WE #(W) R9(clk, 0, write_enable[9], WD3, out9);
	Reg_w_Reset_and_WE #(W) R10(clk, 0, write_enable[10], WD3, out10);
	Reg_w_Reset_and_WE #(W) R11(clk, 0, write_enable[11], WD3, out11);
	Reg_w_Reset_and_WE #(W) R12(clk, 0, write_enable[12], WD3, out12);
	Reg_w_Reset_and_WE #(W) R13(clk, 0, write_enable[13], WD3, out13);
	Reg_w_Reset_and_WE #(W) R14(clk, 0, write_enable[14], WD3, out14);
	Reg_w_Reset_and_WE #(W) R15(clk, 0, 1, R15_in, out15);
	
	mux_16_1 m1(.s0(A1[0]),.s1(A1[1]),.s2(A1[2]),.s3(A1[3]),.in0(out0),.in1(out1),.in2(out2),.in3(out3),.in4(out4),
																			  .in5(out5),.in6(out6),.in7(out7),.in8(out8),.in9(out9),
																			  .in10(out10),.in11(out11),.in12(out12),.in13(out13),.in14(out14),
																			  .in15(out15), .out(RD1));
	mux_16_1 m2(.s0(A2[0]),.s1(A2[1]),.s2(A2[2]),.s3(A2[3]),.in0(out0),.in1(out1),.in2(out2),.in3(out3),.in4(out4),
																			  .in5(out5),.in6(out6),.in7(out7),.in8(out8),.in9(out9),
																			  .in10(out10),.in11(out11),.in12(out12),.in13(out13),.in14(out14),
																			  .in15(out15), .out(RD2));

	
endmodule
