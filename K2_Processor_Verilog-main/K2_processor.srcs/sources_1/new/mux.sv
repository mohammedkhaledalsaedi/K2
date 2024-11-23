`timescale 1ns / 1ps

module mux#(parameter n)(
    input Sreg,
    input [3:0] imm,
    input [n-1:0] ALU,
    output reg [n-1:0] muxout
    );
    
    assign muxout = Sreg?imm:ALU;
    
endmodule
