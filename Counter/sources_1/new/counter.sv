`timescale 1ns / 1ps

module counter(
    input [3:0] D,
    input clk, R,
    input load,
    input sub,
    output [3:0] Q

    );
    wire [3:0] Qb;
    wire [3:0] w;
    
    Dflipflop FF0(.D(w[0]), .clk(clk), .R(R), .Q(Q[0]), .Qb(Qb[0]));
    Dflipflop FF1(.D(w[1]), .clk(clk), .R(R), .Q(Q[1]), .Qb(Qb[1]));
    Dflipflop FF2(.D(w[2]), .clk(clk), .R(R), .Q(Q[2]), .Qb(Qb[2]));
    Dflipflop FF3(.D(w[3]), .clk(clk), .R(R), .Q(Q[3]), .Qb(Qb[3]));
    assign w[0] = load?D[0]:~Q[0];
    assign w[1] = load?D[1]:((Q[0]^sub)^Q[1]);
    assign w[2] = load?D[2]:((((Q[1]^sub)&(Q[0]^sub)))^Q[2]);
    assign w[3] = load?D[3]:((((Q[2]^sub)&(Q[1]^sub)&(Q[0]^sub)))^Q[3]);
endmodule
