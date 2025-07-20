`timescale 1ns / 1ps

module mux4to1(
    input logic [1:0] sel,
    input logic in0,in1,in2,in3,
    output logic mux_out
);
    always_comb 
    begin
    case(sel)
    2'b00: mux_out = in0;
    2'b01: mux_out = in1;
    2'b10: mux_out = in2;
    2'b11: mux_out = in3;
    endcase
    end
endmodule
