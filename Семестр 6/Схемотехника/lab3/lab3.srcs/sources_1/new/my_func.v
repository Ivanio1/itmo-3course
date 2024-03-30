`timescale 1ns / 1ps

module my_func(
    input clk_i,
    input rst_i,
    input [7:0] a_i,
    input [7:0] b_i,
    input start_i,

    output [7:0] an_o,
    output [7:0] cn_o,
    output reg busy
    );

    localparam START = 2'b00;
    localparam MUL_AB = 2'b01;
    localparam MUL_AAA = 2'b10;
    localparam ADD = 2'b11;
    
    reg [1:0] state = START;
    reg [7:0] a;
    reg [15:0] b;
    reg [15:0] ab;
    reg [23:0] aaa;
    reg [23:0] y_o;
    
    reg [1:0] a_mul_cnt = 0;
    reg start_mul = 0;
    wire busy_mul;
    wire [23:0] mul_res;

    reg start_seg7 = 0;

    wire seg7_clk;

    mul my_mul(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .a_bi(a),
        .b_bi(b),
        .start_i(start_mul),

        .busy_o(busy_mul),
        .y_bo(mul_res)
    );   

    frequency_divider frequency_divider(
        .clk_i(clk_i),
        .div_clk_o(seg7_clk)
    );

    res_to_seg7 res_to_seg7(
        .start_i(start_seg7),
        .clk_i(seg7_clk),
        .y_i(y_o),

        .an_o(an_o),
        .cn_o(cn_o)
    );

    always @(posedge clk_i) begin     
        if (rst_i) begin
            a_mul_cnt <= 0; 
            state <= START;
            busy <= 0;
            y_o <= 0;
        end else if (start_mul != 0) begin 
            start_mul <= 0;
        end    
        else begin
            case (state)
                START: begin
                    //start_seg7 <= 0;
                    a <= a_i;
                    b <= {8'b0, b_i};
                    busy <= 0;
                    if(start_i) begin
                        state <= MUL_AB;
                        a <= a_i;
                        b <= b_i;
                        start_mul <= 1;
                        busy <= 1;   
                    end 
                end    

                MUL_AB:
                    if(busy_mul == 0) begin
                        b <= a;
                        start_mul <= 1;
                        ab <= mul_res;
                        state <= MUL_AAA;
                     end
                MUL_AAA:
                    if (a_mul_cnt == 0 && busy_mul == 0) begin
                        b <= mul_res;
                        a_mul_cnt <= a_mul_cnt + 1; 
                        start_mul <= 1;
                    end
                    else if (a_mul_cnt == 1 && busy_mul == 0) begin
                        aaa <= mul_res;
                        state <= ADD;
                        a_mul_cnt <= 0;
                        start_seg7 <= 1;
                    end  
                ADD: begin
                    y_o <= aaa + ab;
                    state <= START;
                end    
            endcase
        end
    end         

endmodule


// cn[7] = ca, cn[6] = cb
// an[0] = an0