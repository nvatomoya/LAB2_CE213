module median_testbench ();
 reg [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9;
 wire [7:0] med;
 reg [7:0] image [0:238220] ;
 integer file,i,j;
median_filter_3x3 duut (.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.med(med));
 initial begin
    $readmemh("pic_input.txt",image);
 end
 initial begin 
    file=$fopen("pic_output.txt","w");
    if(!file) begin
     $display("khong the mo file");
     $finish;
    end
    for(i=0; i<554; i=i+1) begin
    for(j=0;j<430;j=j+1) begin
      if(i==0 || j==0 || i==553 || j==429) begin
      p1 = 0;
        p2 = 0;
        p3 = 0;

        p4 = 0;
        p5 = 0;
        p6 = 0;

        p7 = 0;
        p8 = 0;
        p9 = 0;
        #10;
        $fwrite(file,"%h\n",med);
      end
      else begin
        p1 = image[(i-1)*430 + (j-1)];
        p2 = image[(i-1)*430 + j];
        p3 = image[(i-1)*430 + (j+1)];

        p4 = image[i*430 + (j-1)];
        p5 = image[i*430 + j];
        p6 = image[i*430 + (j+1)];

        p7 = image[(i+1)*430 + (j-1)];
        p8 = image[(i+1)*430 + j];
        p9 = image[(i+1)*430 + (j+1)];
        #10;
        $fwrite(file,"%h\n",med);
    end
   end
    end 
    $fclose(file);
    $finish;
 end
endmodule

