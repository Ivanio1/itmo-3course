`timescale 1ns / 1ps

module mul_tb;

    reg clk = 0;
    reg rst;
    reg [7:0] a;
    reg [15:0] b;
    reg start;

    wire busy;
    wire [23:0] y;
    
    mul mul1(
        .a_bi(a),
        .b_bi(b),
        .start_i(start),
        .clk_i(clk),
        .rst_i(rst),
        
        .busy_o(busy),
        .y_bo(y)
    );
    
    initial begin
    
        assign a = 8'b10101010;
        assign b = 16'hAA; 
        assign rst = 0;
        assign start = 1;   
 
        
    end   
    
    always 
        #5  clk =  ! clk;    //создание clk  
            

endmodule
