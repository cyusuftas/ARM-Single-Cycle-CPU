//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Reg_w_Reset_and_WE #(parameter W= 4) (clk, reset, we, load, out);

	//inputs
	input clk, reset, we;
	input [W-1:0] load;
	
	//outputs
	output reg [W-1:0] out;

	always @ (posedge clk)
	begin
		//check reset
		if(reset == 1) begin
			out <= 0;
		end else begin
			//check write enable
			if(we == 1) begin
				out <= load;
			end
		end
	
	end
endmodule
