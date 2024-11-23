`timescale 1ns / 1ps

module Dregisterbeha#(parameter n)(
    input [n-1:0] D, 
    input clk, R,en,
    output reg [n-1:0] Q
    );
    
    always_ff@(negedge clk, negedge R)
        begin
            if (R == 0) Q<=0;
            else if (en == 0) Q<=Q;
            else Q<=D;
        end
endmodule
