`timescale 1ns / 1ps

module mux4to1_tb;
    logic [1:0] sel;
    logic in0,in1,in2,in3;
    logic mux_out;
    
    mux4to1 dut(.sel(sel),.in0(in0),.in1(in1),.in2(in2),.in3(in3),.mux_out(mux_out));
    initial 
    begin
    {in3,in2,in1,in0} = 4'b1010;
   
    $display("Time\t sel\t mux_in\t mux_out");
    $monitor("%0t\t %b\t %b\t %b", $time, sel, mux_in, mux_out);
    sel = 2'b00; #10;
    sel = 2'b01; #10;
    sel = 2'b10; #10;
    sel = 2'b11; #10;
    $finish;
    end
endmodule
