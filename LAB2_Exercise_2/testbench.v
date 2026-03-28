`timescale 1ns/1ps
module tb ();
	parameter width=2048;
	parameter high=1356;
	reg [7:0] R;
	 reg [7:0]G;
	 reg [7:0] B;
	reg [8:0] Bright;
	wire [7:0] Y;
	RGB inst0 (.data_in_R(R),.data_in_G(G),.data_in_B(B),.Bright(Bright),.Y(Y));
	integer file, result;
	integer output_file;
	initial begin
		Bright=-50;
		file=$fopen("input.txt","r");
		output_file=$fopen("output.txt","w");
		while (!$feof(file)) begin
			result=$fscanf(file, "%h %h %h\n",R,G,B);
			#10;
			$fwrite(output_file,"%h\n",Y );
		end
		$fclose(file);
	end
endmodule