`timescale 1ns / 1ps

module decoder(
    input [2:0] s,
    input en,
    output [7:0] d
);

    wire [2:0] not_s;
    wire [7:0] not_d;
    wire [7:0] s_2_1;
    wire [7:0] not_s_2_1;
    wire [7:0] s_0_en;
    wire [7:0] not_s_0_en;
    
    nand(not_s[2], s[2], s[2]);
    nand(not_s[1], s[1], s[1]);
    nand(not_s[0], s[0], s[0]);

    nand(not_s_2_1[0], not_s[2], not_s[1]);
    nand(not_s_0_en[0], not_s[0], en);
    nand(s_2_1[0], not_s_2_1[0],not_s_2_1[0]);
    nand(s_0_en[0], not_s_0_en[0], not_s_0_en[0]);
    nand(not_d[0], s_2_1[0], s_0_en[0]);
    
    nand(not_s_2_1[1], not_s[2], not_s[1]);
    nand(not_s_0_en[1], s[0], en);
    nand(s_2_1[1], not_s_2_1[1],not_s_2_1[1]);
    nand(s_0_en[1], not_s_0_en[1], not_s_0_en[1]);
    nand(not_d[1], s_2_1[1], s_0_en[1]);
    
    nand(not_s_2_1[2], not_s[2], s[1]);
    nand(not_s_0_en[2], not_s[0], en);
    nand(s_2_1[2], not_s_2_1[2],not_s_2_1[2]);
    nand(s_0_en[2], not_s_0_en[2], not_s_0_en[2]);
    nand(not_d[2], s_2_1[2], s_0_en[2]);
    
    nand(not_s_2_1[3], not_s[2], s[1]);
    nand(not_s_0_en[3], s[0], en);
    nand(s_2_1[3], not_s_2_1[3],not_s_2_1[3]);
    nand(s_0_en[3], not_s_0_en[3], not_s_0_en[3]);
    nand(not_d[3], s_2_1[3], s_0_en[3]);
    
    nand(not_s_2_1[4], s[2], not_s[1]);
    nand(not_s_0_en[4], not_s[0], en);
    nand(s_2_1[4], not_s_2_1[4],not_s_2_1[4]);
    nand(s_0_en[4], not_s_0_en[4], not_s_0_en[4]);
    nand(not_d[4], s_2_1[4], s_0_en[4]);
    
    nand(not_s_2_1[5], s[2], not_s[1]);
    nand(not_s_0_en[5], s[0], en);
    nand(s_2_1[5], not_s_2_1[5],not_s_2_1[5]);
    nand(s_0_en[5], not_s_0_en[5], not_s_0_en[5]);
    nand(not_d[5], s_2_1[5], s_0_en[5]);
    
    nand(not_s_2_1[6], s[2], s[1]);
    nand(not_s_0_en[6], not_s[0], en);
    nand(s_2_1[6], not_s_2_1[6],not_s_2_1[6]);
    nand(s_0_en[6], not_s_0_en[6], not_s_0_en[6]);
    nand(not_d[6], s_2_1[6], s_0_en[6]);
    
    nand(not_s_2_1[7], s[2], s[1]);
    nand(not_s_0_en[7], s[0], en);
    nand(s_2_1[7], not_s_2_1[7],not_s_2_1[7]);
    nand(s_0_en[7], not_s_0_en[7], not_s_0_en[7]);
    nand(not_d[7], s_2_1[7], s_0_en[7]);
    
    nand(d[0], not_d[0], not_d[0]);
    nand(d[1], not_d[1], not_d[1]);
    nand(d[2], not_d[2], not_d[2]);
    nand(d[3], not_d[3], not_d[3]);
    nand(d[4], not_d[4], not_d[4]);
    nand(d[5], not_d[5], not_d[5]);
    nand(d[6], not_d[6], not_d[6]);
    nand(d[7], not_d[7], not_d[7]);

endmodule