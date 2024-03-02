`timescale 1ns / 1ps

module mul(
    input clk_i,
    input rst_i,
    input[7:0] a_bi,
    input[15:0] b_bi,
    input start_i,

    output busy_o,
    output reg [23:0] y_bo
    );

    localparam IDLE = 1'b0;
    localparam WORK = 1'b1;

    reg [4:0] ctr = 0;
    wire [4:0] end_step;
    wire [15:0] part_sum;
    wire [23:0] shifted_part_sum;
    reg [7:0] a;
    reg [15:0] b;
    reg [23:0] part_res; // ������ ������� ����� �� ������ ����
    reg state = IDLE;
    /*
    �� ������ 8 ��������, �� ������ �������� A �� B[i] � ������ ����� = ctr
    ���� ��������� ������������ � shifted_part_sum
    ����� shifted_part_sum ������������ � �������� �������� ����������
    */

    assign part_sum = b & {16{a[ctr]}}; // ��� B ��� 0, �� ������ ��������
    assign shifted_part_sum = part_sum << ctr; // ����� ��� �������� part_sum
    assign end_step = (ctr == 5'b1000); // ����� ���������� ���� = 
    assign busy_o = state;

    always @( posedge clk_i) begin
        if (rst_i) begin
            ctr <= 0;
            part_res <= 0;
            y_bo <= 0;

            state <= IDLE;
        end else begin
            case (state)
                IDLE:
                    if (start_i) begin
                        state <= WORK;

                        a <= a_bi;
                        b <= b_bi;
                        ctr <= 0;
                        part_res <= 0;
                    end
                WORK:
                    begin
                        if (end_step) begin
                            state <= IDLE;
                            y_bo <= part_res;
                        end
                        part_res <= part_res + shifted_part_sum;
                        ctr <= ctr + 1;

                    end
            endcase
        end
    end    
endmodule