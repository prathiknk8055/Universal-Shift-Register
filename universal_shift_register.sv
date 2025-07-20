`timescale 1ns / 1ps

module universal_shift_register(
    input logic CLK, Clear_b,
    input logic [1:0] sel_line,
    input logic [3:0] in,
    input logic msb_in , lsb_in,
    output logic [3:0] out
);
    logic [3:0] mux_out;
    mux4to1 m0(.in0(out[0]),.in1(out[1]),.in2(lsb_in),.in3(in[0]),.sel(sel_line),.mux_out(mux_out[0]));
    mux4to1 m1(.in0(out[1]),.in1(out[2]),.in2(out[0]),.in3(in[1]),.sel(sel_line),.mux_out(mux_out[1]));
    mux4to1 m2(.in0(out[2]),.in1(out[3]),.in2(out[1]),.in3(in[2]),.sel(sel_line),.mux_out(mux_out[2]));
    mux4to1 m3(.in0(out[3]),.in1(msb_in),.in2(out[2]),.in3(in[3]),.sel(sel_line),.mux_out(mux_out[3]));

    d_ff d0(.clk(CLK),.din(mux_out[0]),.q(out[0]),.clear_b(Clear_b));
    d_ff d1(.clk(CLK),.din(mux_out[1]),.q(out[1]),.clear_b(Clear_b));
    d_ff d2(.clk(CLK),.din(mux_out[2]),.q(out[2]),.clear_b(Clear_b));
    d_ff d3(.clk(CLK),.din(mux_out[3]),.q(out[3]),.clear_b(Clear_b));
endmodule
