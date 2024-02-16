`timescale 1ns / 1ps

module decoder_tb;

    reg [2:0] s;
    wire[7:0] d;
    reg en;
    
    integer i;
    
    decoder decoder_1(
        .s(s),
        .d(d),
        .en(en)
    );
    
    initial begin
        for(i = 0; i < 8; i = i+1) begin
            s = i;
            en = 1;
            
            #10
            
            if (d == 2**i) begin
                $display("Correct! s=%b, d=%b, en=%b, i=%0d", s, d, en, i);
            end else begin
                $display("Incorrect! s=%b, d=%b, en=%b, i=%0d", s, d, en, i);
            end
            
            en = 0; 
            
            #10
            
            if (d == 0) begin
                $display("Correct! s=%b, d=%b, en=%b, i=%0d", s, d, en, i);
            end else begin
                $display("Incorrect! s=%b, d=%b, en=%b, i=%0d", s, d, en, i);
            end
                    
         end
         #10 $stop;
         
    end
endmodule