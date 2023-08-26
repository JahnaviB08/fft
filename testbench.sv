`timescale 1ns/1ps

`include "FFT.sv"

`define SAMPLES 16
parameter N = `SAMPLES;

module top();
  
  logic signed [W:0] x[N][1:0];
  logic signed [W+N-1:0] X[N][1:0];

  FFT #(.N(N), .W(W)) RFFT(.x(x), .X(X));
  
  initial begin
    for(int k=0; k<N; k++)begin
      x[k][1]=0;
    end
    
    x[0][0]=0<<<16;
    x[1][0]=1<<<16;
    x[2][0]=2<<<16;
    x[3][0]=3<<<16;
    x[4][0]=4<<<16;
    x[5][0]=5<<<16;
    x[6][0]=6<<<16;
    x[7][0]=7<<<16;
    x[8][0]=8<<<16;
    x[9][0]=9<<<16;
    x[10][0]=10<<<16;
    x[11][0]=11<<<16;
    x[12][0]=12<<<16;
    x[13][0]=13<<<16;
    x[14][0]=14<<<16;
    x[15][0]=15<<<16;
    
    #1
    testFFTinput(.x(x), .X(X));
    $finish;
  end
  
  localparam K=1<<16;
  
  task testFFTinput(input logic signed [W:0] x[N][1:0], 
                    input logic signed [W+N-1:0] X[N][1:0]);
    
    for(int k=0; k<N; k++)
      $display("x[%0d] = %0.3f+i*(%0.3f), X[%0d] = %0.3f+i*(%0.3f)", 
                k, real'(x[k][0])/K, real'(x[k][1])/K, 
                k, real'(X[k][0])/K, real'(X[k][1])/K);
  endtask: testFFTinput

endmodule: top
