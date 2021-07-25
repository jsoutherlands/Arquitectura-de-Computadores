/*
module sumatest;
  wire S1, S0;
  reg A, B, C;
  
  suma sumatest(S1, S0, A, B, C);
  
  initial begin
    $dumpvars(0,sumatest);
    $display ("\n========= Prueba de módulo suma =========\n");
    
    A = 0;
    B = 0;
    C = 0;
    
    #10
    
    A = 1;
    B = 0;
    C = 1;
    
    #10
    
    A = 1;
    B = 1;
    C = 0;
    
    #10
    
    A = 0;
    B = 1;
    C = 0;
    
    #10
    
    $display ("\n=========================================\n");
    $finish;    
  end
  
  initial begin
    $monitor("%b + %b = %b   (Carry in = %b, Carry out = %b)", A, B, S1, C, S0);
  end
endmodule
*/
/*
module sumabitstest;
  wire [7:0] S1;
  reg [7:0] A, B;
  
  sumaBits sumabitstest(S1, A, B);
  
  initial begin
    $dumpvars(0,sumabitstest);
    $display ("\n======= Prueba de módulo sumabits =======\n");
    
    A = 8'b00110011;
    B = 8'b00000000;
    
    #10
    
    A = 8'b00001111;
    B = 8'b01101001;
    
    #10
    
    $display ("\n=========================================\n");
    $finish;    
  end
  
  initial begin
    $monitor("%b + %b = %b", A, B, S1);
  end
endmodule
*/
/*
module restabitstest;
  wire [7:0] S1;
  reg [7:0] A, B;
  
  restaBits restabitstest(S1, A, B);
  
  initial begin
    $dumpvars(0,restabitstest);
    $display ("\n======= Prueba de módulo restabits =======\n");
    
    A = 8'b00010000;
    B = 8'b00001010;
    
    #10
    
    A = 8'b00001010;
    B = 8'b00010000;
    
    #10
    
    $display ("\n==========================================\n");
    $finish;    
  end
  
  initial begin
    $monitor("%b - %b = %b", A, B, S1);
  end
endmodule
*/
/*
module srtest;
  wire Q, notQ;
  reg S, R;
  
  SR srtest(Q, notQ, S, R);
  
  initial begin
    $dumpvars(0,srtest);
    $display ("\n======= Prueba de módulo SR =======\n");
    $display ("	S	R	|	Q	~Q	");
    $display ("	-----------------------------------");
    
    S = 1;
    R = 0;
    
    #10
    
    S = 0;
    R = 0;
    
    #10
    
    S = 0;
    R = 1;
    
    #10
    
    S = 0;
    R = 0;
    
    #10
    
    S = 1;
    R = 0;
    
    #10
    
    S = 0;
    R = 0;
    
    #10
    
    S = 1;
    R = 1;
    
    #10
    
    $display ("\n===================================\n");
    $finish;
  end
  
  initial begin
    $monitor("	%b	%b	|	%b	%b	", S, R, Q, notQ);
  end
  
endmodule
*/
/*
module dtest;
  wire Q, notQ;
  reg CLK, D;
  
  D dtest(Q, notQ, CLK, D);
  
  initial begin
    $dumpvars(0,dtest);
    $display ("\n======= Prueba de módulo D ========\n");
    $display ("	CLK	D	|	Q	~Q	");
    $display ("	-----------------------------------");
    
    CLK = 1;
    D = 0;
    
    #10
    
    CLK = 0;
    D = 1;
    
    #10
    
    CLK = 1;
    D = 1;
    
    #10
    
    CLK = 0;
    D = 0;
    
    #10
    
    $display ("\n===================================\n");
    $finish;
  end
  
  initial begin
    $monitor("	%b	%b	|	%b	%b	", CLK, D, Q, notQ);
  end
endmodule
*/
/*
module fftest;
  wire [7:0] Q;
  reg [7:0] D;
  reg CLK;
  
  FF fftest(Q, D, CLK);
  
  initial begin
    $dumpvars(0,fftest);
    $display ("\n======= Prueba de módulo FF =======\n");
    
    CLK = 1;
    D = 8'b10110000;
    
    #10
    
    CLK = 0;
    D = 8'b10001000;
    
    #10
    
    CLK = 1;
    D = 8'b01010111;
    
    #10
    
    CLK = 0;
    D = 8'b11110011;
    
    #10
    
    $display ("\n===================================\n");
    $finish;
  end
  
  initial begin
    $monitor("CLK = %b, D = %b, Q = %b", CLK, D, Q);
  end
endmodule  
*/
/*
module orbitwisetest;
  wire [7:0] S;
  reg [7:0] X, PX;
  
  orBitwise orbitwisetest(S, X, PX);
  
  initial begin
    $dumpvars(0,orbitwisetest);
    $display ("\n======= Prueba de módulo OR =======\n");
    
    X = 8'b10100010;
    PX = 8'b00111100;
    
    #10
    
    X = 8'b00000001;
    PX = 8'b11100111;
    
    #10
    
    X = 8'b01010101;
    PX = 8'b10101010;
    
    #10
    
    $display ("\n===================================\n");
    $finish;
  end
  initial begin
    $monitor("X = %b, P(X) = %b, S = %b", X, PX, S);
  end
endmodule
*/
/*
module andbitwisetest;
  wire [7:0] S;
  reg [7:0] X, PX;
  
  andBitwise andbitwisetest(S, X, PX);
  
  initial begin
    $dumpvars(0,andbitwisetest);
    $display ("\n====== Prueba de módulo AND =======\n");
    
    X = 8'b10100010;
    PX = 8'b00111100;
    
    #10
    
    X = 8'b00000001;
    PX = 8'b11100111;
    
    #10
    
    X = 8'b01010101;
    PX = 8'b10101010;
    
    #10
    
    $display ("\n===================================\n");
    $finish;
  end
  initial begin
    $monitor("X = %b, P(X) = %b, S = %b", X, PX, S);
  end
endmodule
*/
/*
module slogictest;
  wire [7:0] S;
  reg [7:0] X, PX;
  reg [1:0] M;
  
  SLogic slogictest(S, X, PX, M);
  
  initial begin
    $dumpvars(0,slogictest);
    $display ("\n===== Prueba de módulo SLogic =====\n");
    
    X = 8'b01010101;
    PX = 8'b10101010;
    M = 2'b00;
    
    #10
    
    X = 8'b11110000;
    PX = 8'b11110000;
    M = 2'b01;
    
    #10
    
    X = 8'b10101000;
    PX = 8'b11010110;
    M = 2'b10;
    
    #10
    
    X = 8'b10101000;
    PX = 8'b11010110;
    M = 2'b11;
    
    #10
    
    $display ("\n===================================\n");
    $finish;
  end
  initial begin
    $monitor("X = %b, P(X) = %b, M = %b, S = %b", X, PX, M, S);
  end
endmodule
*/


module testMain;
  wire [7:0] S, PX;
  reg [7:0] X;
  reg [1:0] M;
  reg CLK;
  
  main maintest(S, PX, X, M, CLK);
  
  integer i;
  
  initial begin
    $dumpvars(0,testMain);
    $display ("\n================== Prueba de módulo main ==================\n");
    
    X = 8'b01101001;
    M = 2'b00;
    
    #10
    
    #10
    
    X = 8'b00001111;
    M = 2'b00;
    
    #10
    
    #10
    
    X = 8'b00001010;
    M = 2'b01;
    
    #10
    
    #10
    
    X = 8'b00010000;
    M = 2'b01;
    
    #10
    
    #10
    
    X = 8'b00110011;
    M = 2'b10;
    
    #10
    
    #10
    
    X = 8'b00001111;
    M = 2'b10;
    
    #10
    
    #10
    
    X = 8'b00110011;
    M = 2'b11;
    
    #10
    
    #10
    
    X = 8'b00001111;
    M = 2'b11;
    
    #10
    
    $display ("\n===========================================================\n");
    $finish;
  end
  
  initial begin
    CLK = 1;
    for ( i = 0; i<=13; i=i+1)
      #10 CLK = ~CLK;
  end

  initial begin
    $monitor("CLK= %b, M = %b, X = %b, P(X) = %b, S = %b", CLK, M, X, PX, S);
  end
endmodule
