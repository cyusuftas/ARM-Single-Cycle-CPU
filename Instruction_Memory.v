//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Instruction_Memory(A, RD);
	
	input [31:0] A;
	
	output reg [31:0] RD;
	
	//instruction memory is constructed with 256 addressable bytes
	reg [7:0] instr_mem [0:255];
	
	
	integer i;																		  	  //memory instr:\\
	initial begin																//|cnd|op|I'|xxxx|L|Rn|Rd|imm12|\\
		{instr_mem[3],instr_mem[2],instr_mem[1],instr_mem[0]} = 32'b11100100000100010001000000000100;
		{instr_mem[7],instr_mem[6],instr_mem[5],instr_mem[4]} = 32'b11100100000100110010000000001000;
																						  //data processing instr\\
																					//|cnd|op|I|cmd|S|Rn|Rd|8'b0|Rm|\\
		{instr_mem[11],instr_mem[10],instr_mem[9],instr_mem[8]} = 32'b11100001010000010000000000000010;			//CMP
		//{instr_mem[11],instr_mem[10],instr_mem[9],instr_mem[8]} = 32'b11100000100000010000000000000010;			//ADD
		{instr_mem[15],instr_mem[14],instr_mem[13],instr_mem[12]} = 32'b00000000100000010000000000000010;			//conditional add
		//{instr_mem[15],instr_mem[14],instr_mem[13],instr_mem[12]} = 32'b11100000010000010000000000000010;		//SUB
		{instr_mem[19],instr_mem[18],instr_mem[17],instr_mem[16]} = 32'b11100000000000010000000000000010;		//AND
		{instr_mem[23],instr_mem[22],instr_mem[21],instr_mem[20]} = 32'b11100001100000010000000000000010;		//OR
		{instr_mem[27],instr_mem[26],instr_mem[25],instr_mem[24]} = 32'b11100010011000010000000000000001;		//LSL 
		{instr_mem[31],instr_mem[30],instr_mem[29],instr_mem[28]} = 32'b11100010001000010000000000000001;		//LSR
		for(i=32; i<256; i= i+1) begin
			instr_mem[i] = i;
		end
	end
	
	always @(A)
	begin
		//read returns 32bits - Little Endian
		RD = {instr_mem[A+3],instr_mem[A+2],instr_mem[A+1],instr_mem[A]};
	end

endmodule
