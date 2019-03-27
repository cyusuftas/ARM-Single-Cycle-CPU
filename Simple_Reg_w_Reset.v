//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module Simple_Reg_w_Reset #(parameter W=4)(clk, reset, load, out);

	//inputs
	input [W-1:0] load;
	input clk, reset;
	
	//output
	output reg [W-1:0] out;
	
	initial begin
		out <= 0;
	end
	
	always @ (posedge clk)
	begin
		//check reset
		if(reset == 1) begin
			out <= 0;
		end else begin
			out <= load;
		end
 	
	end
	
endmodule
