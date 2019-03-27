//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module ALU #(parameter W=4)(A, B, s2, s1, s0, CO, OVF, N, Z, out);
	
	//inputs and outputs
	input [W-1:0] A, B;
	input s0, s1, s2;
	
	output reg [W-1:0] out;
	output reg CO, OVF, N, Z;
	
	//internal registers
	reg [W-1:0] opr_1, opr_2;
	reg [W:0] result;
	reg nz_flag, oc_flag;
	
	//initially everything is 0
	initial begin
		CO = 0;
		OVF = 0;
		N = 0;
		Z = 0;
		nz_flag = 0;
		oc_flag = 0;
	end
	
	//* is used so it is updated whenever any input changes
	always @ (*) 
	begin
		//set whether to update flags or not
		if({s2,s1,s0} > 3'b010) begin
			nz_flag = 1;
			oc_flag = 0;
		end else begin
			nz_flag = 1;
			oc_flag = 1;
		end
		
		//arithmetic and logic operations
		if({s2,s1,s0} == 3'b000) begin
			opr_1 = A;
			opr_2 = B;
			result = A + B;
		end else if({s2,s1,s0} == 3'b001) begin
			opr_1 = A;
			opr_2 = ~B + 1'b1; 
			result = A + ~B + 1'b1;
		end else if({s2,s1,s0} == 3'b010) begin
			opr_1 = B;
			opr_2 = ~A + 1'b1;
			result = B + ~A + 1'b1;
		end else if({s2,s1,s0} == 3'b011) begin
			result = A & ~B;
		end else if({s2,s1,s0} == 3'b100) begin
			result = A & B;
		end else if({s2,s1,s0} == 3'b101) begin
			result = A | B;
		end else if({s2,s1,s0} == 3'b110) begin
			result = A ^ B;
		end else if({s2,s1,s0} == 3'b111) begin
			result = ~(A ^ B);
		end
	
		//check and evaluate N and Z flags
		if(nz_flag == 1) begin
			if(result[W-1] == 1) begin
				N = 1;
			end else begin
				N = 0;
			end
			
			if(result[W-1:0] == 0) begin
				Z = 1;
			end else begin
				Z = 0;
			end
		end
		
		//check and evaluate CO and OVF flags
		if(oc_flag == 1) begin
			CO	= result[W];
			OVF = ((opr_1[W-1] == 0 & opr_2[W-1] == 0 & result[W-1] == 1) | (opr_1[W-1] == 1 & opr_2[W-1] == 1 & result[W-1] == 0)) ? 1 : 0; //result[W] ^ result[W-1];
		end else begin
			CO = 0;
			OVF = 0;
		end
	
		out = result[W-1:0];
	end

endmodule
