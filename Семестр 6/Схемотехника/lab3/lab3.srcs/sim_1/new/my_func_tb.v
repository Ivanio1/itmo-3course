`timescale 1ns / 1ps

module my_func_tb;

    reg clk = 0;
    reg rst = 0;
    reg [7:0] a;
    reg [7:0] b;
    reg start = 0;

    wire [7:0] cn;
    wire [7:0] an;
    wire busy;

    my_func my_func1(
        .clk_i(clk),
        .rst_i(rst),
        .a_i(a),
        .b_i(b),
        .start_i(start),

        .an_o(an),
        .cn_o(cn),
        .busy(busy)
    );

    task test_func;
        input [3:0] iter;
        input [7:0] test_a;
        input [7:0] test_b;
        input [23:0] test_res;
        begin
            a = test_a;
            b = test_b;
            start = 1;
            #10
            start = 0;
            while (busy) begin
                #5;
            end
            // if(y == test_res) $display("Test %d: Correct", iter);
            // else $display("Test %d: Failed %d", iter, y);
        end
    endtask

    initial begin
        // // Время вычисления результата при частоте тактового сигнала в 100 МГц
        // a = 255;
        // b = 255;
        // start = 1;
        // #250;
        // rst = 1;



        // 10 test 
         //test_func(1, 1, 0, 0);
        // test_func(2, 1, 0, 1);
         test_func(3, 1, 1, 2);
        // test_func(4, 2, 2, 12);
        // test_func(5, 15, 240, 6975);
        // test_func(6, 240, 15, 13827600);
        // test_func(7, 170, 85, 4927450);
        // test_func(8, 85, 170, 628575);
        // test_func(9, 100, 125, 1012500);
        // test_func(10, 255, 255, 16646400);


        // 00000000 , 00000000 -> 000000
        // 00000001 , 00000000 -> 000001
        // 00000001 , 00000001 -> 000002
        // 00000010 , 00000010 -> 00000C
        // 00001111 , 11110000 -> 001B3F
        // 11110000 , 00001111 -> D2FE10
        // 10101010 , 01010101 -> 4B2FDA
        // 01010101 , 10101010 -> 09975F
        // 01100100 , 01111101 -> 0F7314
        // 11111111 , 11111111 -> FE0100

        
    end   
    
    always begin
        #5  clk =  ! clk;    //создание clk
    end    

endmodule