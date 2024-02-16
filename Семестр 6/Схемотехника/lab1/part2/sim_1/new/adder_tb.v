`timescale 1ns / 1ps

module adder_tb;

    reg a_in, b_in;
    wire c_out;
    
    adder adder_1(
        .a(a_in),
        .b(b_in),
        .c(c_out)
    );
    
    integer i;
    reg[1:0] test_val;
    reg expected_val;
    
    initial begin
    
        for (i = 0; i < 4; i = i+1) begin
            test_val = i;
            a_in = test_val[0];
            b_in = test_val[1];
            expected_val = ^test_val;
            
            #10
            
            if (c_out == expected_val) begin
                $display("The adder output is correct!!! a_in=%b,b_in=%b c_out = %b",
                                        a_in, b_in, c_out); 
            end else begin
                $display("The adder output is wrong!!! a_in=%b,b_in=%b c_out = %b, expected %b",
                                        a_in, b_in, c_out, expected_val);
            end
        end
        
        #10 $stop;
        
    end
    
endmodule