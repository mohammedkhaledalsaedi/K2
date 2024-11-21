`timescale 1ns / 1ps

module half_adder(
    input logic a,
    input logic b,
    output logic s,
    output logic c

    );
    
    xor u_xor(s,a,b);
    and u_and(c,a,b);
endmodule
