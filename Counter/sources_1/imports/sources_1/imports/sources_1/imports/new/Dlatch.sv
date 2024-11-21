`timescale 1ns / 1ps

module Dlatch(
    input clk, D,R,
    output Q,Qb

    );
    wire w1,w2,Q0;
    
    assign w1 = ~(D&clk);
    assign w2 = ~(~D&clk);
    assign Q0 = ~(w1&Qb);
    assign Q = Q0&R;
    assign Qb = ~(w2&Q);
    
endmodule
