//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Cond_Logic(clk, Cond, ALUFlags, FlagW, PCS, RegW, MemW, NoWrite, PCSrc, RegWrite, MemWrite);
	
	//inputs
	input [3:0] Cond, ALUFlags;
	input [1:0] FlagW;
	input clk, PCS, RegW, MemW, NoWrite;
	
	//outputs
	output wire PCSrc, RegWrite, MemWrite;
	
	//Wires
	wire [1:0] Flags_NZ, Flags_CV, FW;
	reg cond_ex;
	
	//structural components
	and a1(FW[1], FlagW[1], cond_ex);
	and a2(FW[0], FlagW[0], cond_ex);
	
	Reg_w_Reset_and_WE #(2) Flags_NZ_reg(clk, 0, FW[1], ALUFlags[3:2], Flags_NZ[1:0]);
	Reg_w_Reset_and_WE #(2) Flags_CV_reg(clk, 0, FW[0], ALUFlags[1:0], Flags_CV[1:0]);
	
	and a3(PCSrc, PCS, cond_ex);
	and a4(MemWrite, MemW, cond_ex);
	and a5(RegWrite, ~NoWrite, RegW, cond_ex);
	
	//check whether condition is satisfied or not
	always @ (Cond or Flags_NZ[0]) 
	begin
		if(Cond[3:0] == 4'b1110) begin
			cond_ex = 1;
		end else if((Cond[3:0] == 4'b0000) & Flags_NZ[0] == 1) begin
			cond_ex = 1;
		end else begin
			cond_ex = 0;
		end
	end


endmodule

