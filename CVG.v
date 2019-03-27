//Cahit Yusuf Taş - 1937465
//cyusuftas@gmail.com

//Constant Value Generator
module CVG #(parameter W=4, k=4'b1011) (out);

	output reg [W-1:0] out;		//Create a W bit reg
		
	initial begin
		out = k;					//Continuosly assign output to given parameter
	end
	
endmodule
