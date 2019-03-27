//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Controller(clk, ALUFlags, Cond, Op, Funct, Rd, RegWrite, ALUControl, MemWrite, RegSrc, ALUSrc, ResultSrc, PCSrc, sh_dir);
	
	//inputs
	input clk;
	input [3:0] Cond, ALUFlags, Rd;
	input [1:0] Op;
	input [5:0] Funct;
	
	//outputs
	output wire PCSrc, RegWrite, MemWrite, ALUSrc, RegSrc, sh_dir;
	output wire [1:0] ResultSrc;
	output wire [2:0] ALUControl;
	
	//internal wires
	wire [1:0] FlagW;
	wire PCS, RegW, MemW, NoWrite, ALUOp;
	
	//create and connect components
	Main_Decoder m_d(.funct5_0(Funct[5:0]), .Op(Op), .Rd(Rd), .PCS(PCS), .RegW(RegW), .MemW(MemW), .ResultSrc(ResultSrc), .ALUSrc(ALUSrc), .RegSrc(RegSrc), .ALUOp(ALUOp), .sh_dir(sh_dir));
	ALU_Decoder a_d(.funct4_0(Funct[4:0]), .ALUOp(ALUOp), .ALUControl(ALUControl[2:0]), .FlagW(FlagW[1:0]), .NoWrite(NoWrite));
	Cond_Logic c_l(.clk(clk), .Cond(Cond[3:0]), .ALUFlags(ALUFlags[3:0]), .FlagW(FlagW[1:0]), .PCS(PCS), .RegW(RegW), .MemW(MemW), .NoWrite(NoWrite), .PCSrc(PCSrc), .RegWrite(RegWrite), .MemWrite(MemWrite));

endmodule
