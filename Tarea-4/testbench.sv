module test;
  wire [7:0] S;
  reg [7:0] X;
  reg [1:0] M;
  reg CLK;
  
  main maintest(S, X, M, CLK);
  
  integer i;
  
  initial begin
    $dumpvars(0,test);    
    X = 8'b00000000;
    M = 2'b00;
    
    #10
    
    X = 8'b00000000;
    M = 2'b00;
    
    #10
    
    X = 8'b01010100;
    M = 2'b00;
    
    #10
    
    X = 8'b01010100;
    M = 2'b00;
    
    #10
    
    X = 8'b10101011;
    M = 2'b00;
    
    #10
    
    X = 8'b10101011;
    M = 2'b00;
  end
  
  initial begin
    CLK = 0;
    for ( i = 0; i<=4; i=i+1)
      #10 CLK = ~CLK;
  end
  
  initial begin
    $monitor("CLK=%b, X = %b, M = %b, S = %b\n", CLK, X, M, S);
  end
endmodule
