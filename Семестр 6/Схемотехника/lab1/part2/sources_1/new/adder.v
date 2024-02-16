`timescale 1ns / 1ps

module adder(
    input a,
    input b,
    output c
);

    wire not_a, not_b, y1, y2;
    
    nand(not_a, a, a);
    nand(not_b, b, b);
    
    nand(y1, not_a, b);
    nand(y2, a, not_b);
    
    nand(c, y1, y2);
    
endmodule
