`timescale 1ns / 1ps

module d_ff(
    input logic din,
    input logic clk,clear_b,
    output logic q, qbar
    );
    always_ff @(posedge clk)
    begin
    if(clear_b == 1'b0)begin
        q <= 0;
    end else begin
        q <= din;
    end
    end
    assign qbar = ~q;
endmodule
