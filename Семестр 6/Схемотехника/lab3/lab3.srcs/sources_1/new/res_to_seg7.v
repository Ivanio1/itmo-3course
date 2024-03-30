`timescale 1ns / 1ps


module res_to_seg7(
    input clk_i,
    input start_i,
    input [23:0] y_i, 

    output reg [7:0] an_o,
    output reg [7:0] cn_o
    );

    reg [3:0] cnt = 3'b000;


    always @(posedge clk_i) begin   
        if(start_i) begin
            case (cnt)
                0: begin
                    an_o <= 8'b11111110;
                    cn_o <= calc_num(y_i[3:0]);
                end    
                1: begin
                    an_o <= 8'b11111101;
                    cn_o <= calc_num(y_i[7:4]);
                end 
                2: begin
                    an_o <= 8'b11111011;
                    cn_o <= calc_num(y_i[11:8]);
                end 
                3: begin
                    an_o <= 8'b11110111;
                    cn_o <= calc_num(y_i[15:12]);
                end 
                4: begin
                    an_o <= 8'b11101111;
                    cn_o <= calc_num(y_i[19:16]);
                end
                5: begin
                    an_o <= 8'b11011111;
                    cn_o <= calc_num(y_i[23:20]);
                end 
            endcase       
        end    
    end    


    always @(posedge clk_i) begin   
        if(start_i) begin
            if(cnt != 5) begin
                cnt <= cnt + 1;
            end
            else begin
                cnt <= 0;
            end        
        end    
    end  

    function [7:0] calc_num;
        input [3:0] num_i;
            begin
                case (num_i)
                    4'b0000: begin
                        calc_num = 8'b00000011;
                    end   

                    4'b0001: begin
                        calc_num = 8'b10011111;
                    end   
                    
                    4'b0010: begin
                        calc_num = 8'b00100101;
                    end   

                    4'b0011: begin
                        calc_num = 8'b00001101;
                    end   
                    
                    4'b0100: begin
                        calc_num = 8'b10011001;
                    end   
                    
                    4'b0101: begin
                        calc_num = 8'b01001001;
                    end   
                    
                    4'b0110: begin
                        calc_num = 8'b01000001;
                    end   
                    
                    4'b0111: begin
                        calc_num = 8'b00011111;
                    end   

                    4'b1000: begin
                        calc_num = 8'b00000001;
                    end   

                    4'b1001: begin
                        calc_num = 8'b00001001;
                    end   

                    4'b1010: begin
                        calc_num = 8'b00010001;
                    end   

                    4'b1011: begin
                        calc_num = 8'b11000001;
                    end   

                    4'b1100: begin
                        calc_num = 8'b01100011;
                    end   

                    4'b1101: begin
                        calc_num = 8'b10000101;
                    end   

                    4'b1110: begin
                        calc_num = 8'b01100001;
                    end   

                    4'b1111: begin
                        calc_num = 8'b01110001;
                    end   

                endcase 
            end    
    endfunction

endmodule
