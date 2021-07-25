module suma(
  output S1,S0,
  input A,B,C);
  
  wire w1, w2, w3, w4, w5, w6, w7;
  
  and (w1, ~A, ~B, C);
  and (w2, ~A, B, ~C);
  and (w3, A, ~B, ~C);
  and (w4, A, B, C);
  or (S1, w1, w2, w3, w4);
  and (w5, B, C);
  and (w6, A, C);
  and (w7, A, B);
  or (S0, w5, w6, w7);
  
endmodule

module sumaBits(
  output [7:0] S1,
  input [7:0] A, B);
  
  wire c1, c2, c3, c4, c5, c6, c7;
  
  suma s0(
    S1[0], c1,
    A[0], B[0], 1'b0);
  suma s1(
    S1[1], c2,
    A[1], B[1], c1);
  suma s2(
    S1[2], c3,
    A[2], B[2], c2);
  suma s3(
    S1[3], c4,
    A[3], B[3], c3);
  suma s4(
    S1[4], c5,
    A[4], B[4], c4);
  suma s5(
    S1[5], c6,
    A[5], B[5], c5);
  suma s6(
    S1[6], c7,
    A[6], B[6], c6);
  suma s7(
    S1[7],,
    A[7], B[7], c7);
endmodule

module restaBits(
  output [7:0] S1,
  input [7:0] A, B);
  
  wire c1, c2, c3, c4, c5, c6, c7;
  
  suma s0(
    S1[0], c1,
    A[0], ~B[0], 1'b1);
  suma s1(
    S1[1], c2,
    A[1], ~B[1], c1);
  suma s2(
    S1[2], c3,
    A[2], ~B[2], c2);
  suma s3(
    S1[3], c4,
    A[3], ~B[3], c3);
  suma s4(
    S1[4], c5,
    A[4], ~B[4], c4);
  suma s5(
    S1[5], c6,
    A[5], ~B[5], c5);
  suma s6(
    S1[6], c7,
    A[6], ~B[6], c6);
  suma s7(
    S1[7],,
    A[7], ~B[7], c7);
endmodule

module SR(
  output Q, notQ,
  input R, S);
  
  nor (Q, R, notQ);
  nor (notQ, S, Q);
  
endmodule

module D(
  output Q, notQ,
  input CLK, D);
  
  wire c1, c2;
  
  and (c1, CLK, ~D);
  and (c2, CLK, D);
  
  SR sr(
    Q, notQ,
    c1, c2);
  
endmodule
    
module FF(
  output [7:0]Q,
  input [7:0]D,
  input CLK);
  
  D d0(
    Q[0],,
    CLK, D[0]);
  D d1(
    Q[1],,
    CLK, D[1]);
  D d2(
    Q[2],,
    CLK, D[2]);
  D d3(
    Q[3],,
    CLK, D[3]);
  D d4(
    Q[4],,
    CLK, D[4]);
  D d5(
    Q[5],,
    CLK, D[5]);
  D d6(
    Q[6],,
    CLK, D[6]);
  D d7(
    Q[7],,
    CLK, D[7]);
endmodule
    
module orBitwise(
  output [7:0]S,
  input [7:0]X, PX);
  
  or (S[0], X[0], PX[0]);
  or (S[1], X[1], PX[1]);
  or (S[2], X[2], PX[2]);
  or (S[3], X[3], PX[3]);
  or (S[4], X[4], PX[4]);
  or (S[5], X[5], PX[5]);
  or (S[6], X[6], PX[6]);
  or (S[7], X[7], PX[7]);
  
endmodule

module andBitwise(
  output [7:0]S,
  input [7:0]X, PX);
  
  and (S[0], X[0], PX[0]);
  and (S[1], X[1], PX[1]);
  and (S[2], X[2], PX[2]);
  and (S[3], X[3], PX[3]);
  and (S[4], X[4], PX[4]);
  and (S[5], X[5], PX[5]);
  and (S[6], X[6], PX[6]);
  and (S[7], X[7], PX[7]);
  
endmodule
    

module SLogic(
  output reg [7:0] S,
  input [7:0] X, PX,
  input [1:0] M);
  
  wire [7:0] w1, w2, w3, w4;
  
  sumaBits m00(w1, X, PX);
  restaBits m01(w2, X, PX);
  orBitwise m10 (w3, X, PX);
  andBitwise m11 (w4, X, PX);
  
  always @ (w1 or w2 or w3 or w4 or M) begin
    case(M)
      2'b00 : S <= w1;
      2'b01 : S <= w2;
      2'b10 : S <= w3;
      2'b11 : S <= w4;
  	endcase
  end
endmodule

module main(
  output [7:0] S, PX,
  input [7:0] X,
  input [1:0] M,
  input CLK);
  
  wire [7:0]w1;
  
  FF ff1(
    w1,
    X, CLK);
  FF ff2(
    PX,
    w1, ~CLK);
  SLogic slmain(
    S,
    w1, PX, M);
endmodule
