//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Main_Decoder(funct5_0,Op,Rd,PCS,RegW,MemW,ResultSrc,ALUSrc,RegSrc,ALUOp,sh_dir);
		
	//inputs
	input [5:0] funct5_0;
	input [1:0] Op;
	input [3:0] Rd;
	
	//Outputs
	output reg [1:0] ResultSrc;
	output reg PCS, RegW, MemW, ALUSrc, RegSrc, ALUOp, sh_dir;
	
	//PC Logic
	always @ (Rd)
	begin
		if(Rd == 4'b1111 & RegW) begin
			PCS = 1;
		end else begin
			PCS = 0;
		end
	end
		
	//whenever inputs change
	always @ (funct5_0 or Op)
	begin
		//data processing instr.
		if(Op[1:0] == 2'b00) begin
			//ADD, SUB, AND, ORR
			if(funct5_0[5] == 0 & (funct5_0[4:1] == 4'b0100 | funct5_0[4:1] == 4'b0010 | funct5_0[4:1] == 4'b0000 | funct5_0[4:1] == 4'b1100)) begin
				ResultSrc = 2'b01;
				MemW = 0;
				ALUSrc = 0; 
				RegW = 1;
				RegSrc = 0;
				ALUOp = 1;
			//LSL
			end else if(funct5_0[5] == 1 & funct5_0[4:1] == 4'b0011) begin
				ResultSrc = 2'b10;
				MemW = 0; 
				RegW = 1;
				ALUOp = 0;
				sh_dir = 0;
			//LSR
			end else if(funct5_0[5] == 1 & funct5_0[4:1] == 4'b0001) begin
				ResultSrc = 2'b10;
				MemW = 0; 
				RegW = 1;
				ALUOp = 0;
				sh_dir = 1;
			//CMP
			end else if(funct5_0[5] == 0 & funct5_0[4:1] == 4'b1010) begin
				MemW = 0;
				ALUSrc = 0;
				RegW = 0;
				RegSrc = 0;
				ALUOp = 1;
			end
		//Memory instructions
		end else if(Op[1:0] == 2'b01) begin
			//LDR
			if(funct5_0[0] == 1 & funct5_0[5] == 0) begin
				ResultSrc = 2'b00;
				MemW = 0;
				ALUSrc = 1; 
				RegW = 1;
				ALUOp = 0;
			//STR
			end else if(funct5_0[0] == 0 & funct5_0[5] == 0) begin
				MemW = 1;
				ALUSrc = 1; 
				RegW = 1;
				RegSrc = 1;
				ALUOp = 0;
			end
		end
	end
		
endmodule
