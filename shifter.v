//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

module shifter(data, sh_amnt, sh_dir, out);
	input [31:0] data;
	input [31:0] sh_amnt;
	input sh_dir;
	
	output reg [31:0] out;
	
	always @(*)
	begin
		if(sh_dir) begin					//shift right
			out = data >> sh_amnt;
		end else begin						//shift left
			out = data << sh_amnt;
		end
	end

endmodule
