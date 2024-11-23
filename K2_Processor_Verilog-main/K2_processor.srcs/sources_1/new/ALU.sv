`timescale 1ns / 1ps

module ALU#(parameter n)(
    input [n-1:0] a,
    input [n-1:0] b,
    input s,
    output logic [n-1:0] sum,
    output logic cout
    );
    
    always@(*)
    begin 
    if (!s) begin
        {cout,sum} = a+b;
        end
    else begin
        {cout,sum} = a-b;
        end
    end
endmodule
