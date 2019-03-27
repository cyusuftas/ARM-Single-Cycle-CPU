//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module ALU_Decoder(funct4_0, ALUOp, ALUControl, FlagW, NoWrite);
	
	//inputs
	input [4:0] funct4_0;
	input 		ALUOp;
	
	//outputs
	output reg [2:0] 	ALUControl;
	output reg [1:0] 	FlagW;
	output reg 			NoWrite;

	//whenever funct[4:0] or ALUOp input change
	always @ (funct4_0 or ALUOp)
	begin
		//if not data processing instr.
		if(!ALUOp) begin
			ALUControl = 3'b000;
			NoWrite = 0;
			FlagW = 2'b00;
		//data processing instructions
		end else begin
			//ADD
			if(funct4_0[4:1] == 4'b0100) begin
				ALUControl = 3'b000;
				NoWrite = 0;
				FlagW = funct4_0[0] ? 2'b11 : 2'b00;
			//SUB
			end else if(funct4_0[4:1] == 4'b0010) begin
				ALUControl = 3'b001;
				NoWrite = 0;
				FlagW = funct4_0[0] ? 2'b11 : 2'b00;
			//AND
			end else if(funct4_0[4:1] == 4'b0000) begin
				ALUControl = 3'b100;
				NoWrite = 0;
				FlagW = funct4_0[0] ? 2'b10 : 2'b00;
			//ORR
			end else if(funct4_0[4:1] == 4'b1100) begin
				ALUControl = 3'b101;
				NoWrite = 0;
				FlagW = funct4_0[0] ? 2'b10 : 2'b00;
			//CMP
			end else if(funct4_0[4:1] == 4'b1010) begin
				ALUControl = 3'b001;
				NoWrite = 1;
				FlagW = 2'b11;
			end
		end
	end	
endmodule
