`timescale 1ns / 1ps

module full_adder(
    input logic a,
    input logic b,
    input logic cin,
    output logic s2,
    output logic cout

    );
    logic s1,c1,c2;    
    half_adder a1(.s(s1),.c(c1),.a(a),.b(b));
    half_adder a2(.s(s2), .c(c2),.a(cin),.b(s1));
    or u_or(cout,c1,c2);
    
endmodule
