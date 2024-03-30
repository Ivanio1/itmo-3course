`timescale 1ns / 1ps

module frequency_divider(
    input clk_i,
    output reg div_clk_o = 0
    );

    reg [24:0] cnt = 0;

    always@(posedge clk_i) begin
        if(cnt == 99999) begin
            cnt <= 0;
            div_clk_o <= ~div_clk_o;
        end    
        else cnt <= cnt + 1;
    end  

endmodule
