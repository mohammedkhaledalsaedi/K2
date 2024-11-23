`timescale 1ns / 1ps

module Datamemory(
    input clk,en,
    input [3:0] imm,
    input reg [7:0] RA,
    output reg [7:0]data[0:7],
    output reg [7:0]dataout
    );
always_ff@(posedge clk)
    if (en == 1) begin 
        case (imm)
            4'b0000: data[0] <=RA;
            4'b0001: data[1]<=RA;
            4'b0010: data[2]<=RA;
            4'b0011: data[3] <=RA;
            4'b0100: data[4]<=RA;
            4'b0101: data[5]<=RA;
            4'b0110: data[6] <=RA;
            4'b0111: data[7]<=RA;
            default: data[imm] <=RA;
            endcase
            
            end
    else if (en ==0)
        case (imm)
            4'b0000: dataout =data[0];
            4'b0001: dataout=data[1];
            4'b0010: dataout=data[2];
            4'b0011: dataout <=data[3];
            4'b0100: dataout<=data[4];
            4'b0101: dataout<=data[5];
            4'b0110: dataout <=data[6];
            4'b0111: dataout<=data[7];
            default: 
            dataout <=data[imm];
            endcase
            
       
endmodule
