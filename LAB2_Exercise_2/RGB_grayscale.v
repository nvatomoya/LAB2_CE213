module RGB (data_in_R,data_in_G,data_in_B,Bright, Y);
input wire signed [8:0] Bright;
input [7:0] data_in_R;
input [7:0] data_in_G;
input [7:0] data_in_B;
output [7:0] Y;
wire [10:0] R_out;
wire [11:0] G_out;
wire [8:0] B_out;
wire [12:0] temp;
wire signed [9:0] temp1;
assign R_out= {data_in_R,2'b00} + data_in_R;
assign G_out= {data_in_G,3'b000} + data_in_G;
assign B_out= {data_in_B,1'b0};
assign temp= R_out+G_out +B_out;
assign temp1= $signed((temp>>4))+ Bright;
assign Y= ( temp1>9'sd255)? 255 : ((temp1 <9'sd0) ?0 : temp1[7:0]);
endmodule
