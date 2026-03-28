module median_filter_3x3 (p1,p2,p3,p4,p5,p6,p7,p8,p9,med);
input [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;
output [7:0] med;
sort9 inst0 (.in1(p1),.in2(p2),.in3(p3),.in4(p4),.in5(p5),.in6(p6),.in7(p7),.in8(p8),.in9(p9),.med(med));
endmodule
