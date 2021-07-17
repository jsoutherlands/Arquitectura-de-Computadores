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
  output S0,
  input [7:0] A, B,
  input C);
  
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
    S1[7], S0,
    A[7], B[7], c7);
endmodule

module restaBits(
  output [7:0] S1,
  output S0,
  input [7:0] A, B,
  input C);
  
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
    S1[7], S0,
    A[7], ~B[7], c7);
endmodule

module SR(
  output Q, notQ,
  input S, R);
  
  nor (Q, S, notQ);
  nor (notQ, R, Q);
  
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
  
  //wire w0, w1, w2, w3, w4, w5, w6, w7;
  
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
