/*
module test;
  wire [7:0] S1;
  wire S0;
  reg [7:0] A, B;
  reg C;
  
  
  restaBits suma(S1, S0, A, B, C);
  
  initial begin
    $dumpvars(0,test);
    
    #5;
    A = 8'b00110011;
    B = 8'b00000000;
    
    #5
    
    $finish;
  end
endmodule
*/

/*
module test;
  wire Q, notQ;
  reg S,R;
  
  SR srtest(Q, notQ, S, R);
  
  initial begin
    $dumpvars(0,test);
    
    #5
    
    S=1'b1;
    R=1'b0;
    
    #5
    
    $finish;
  end
endmodule
*/
/*
module test;
  wire Q, notQ;
  reg CLK, D;
  
  D dtest(
    Q, notQ,
    CLK, D);
  
  initial begin
    $dumpvars(0,test);
    
    #5
    
    CLK = 1;
    D = 0;
    
    #5
    
    CLK = 1;
    D = 1;
    
    #5
    
    CLK = 0;
    D = 0;
    
    #5
    
    $finish;
    
  end
endmodule
*/

/*

module test;
  wire [7:0] Q;
  reg [7:0] D;
  reg CLK;
  
  FF fftest(
    Q,
    D, CLK);
  
  initial begin
    $dumpvars(0,test);
    #5
    
    CLK = 1;
    D = 8'b01100110;
    
    #5
    
    CLK = 0;
    D = 8'b10000000;
    
    #5
    
    CLK = 1;
    D = 8'b11001100;
    
    #5
    
    $finish;
    
  end
  
endmodule
*/
