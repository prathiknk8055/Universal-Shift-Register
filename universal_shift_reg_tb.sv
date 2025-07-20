`timescale 1ns / 1ps

module universal_shift_tb;
  logic CLK, Clear_b;
  logic [1:0] sel_line;
  logic [3:0] in;
  logic msb_in, lsb_in;
  logic [3:0] out;


  universal_shift_register uut (
    .CLK(CLK),
    .Clear_b(Clear_b),
    .sel_line(sel_line),
    .in(in),
    .msb_in(msb_in),
    .lsb_in(lsb_in),
    .out(out)
  );


  always #5 CLK = ~CLK;

  
  initial begin
    $display("Time\tSel\tIn\tMSB\tLSB\tOut");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, sel_line, in, msb_in, lsb_in, out);

 
    CLK = 0;
    Clear_b = 0;  
    sel_line = 2'b00;
    in = 4'b0000;
    msb_in = 1'b0;
    lsb_in = 1'b0;

    #10;
    Clear_b = 1;  

    // Parallel Load: sel_line = 11
    sel_line = 2'b11;
    in = 4'b1011; // Load 1011
    #10;

    // Hold: sel_line = 00
    sel_line = 2'b00;
    #10;

    // Shift Right: sel_line = 01
    sel_line = 2'b01;
    msb_in = 1'b1;  // msb
    #10;
    #10;

    // Shift Left: sel_line = 10
    sel_line = 2'b10;
    lsb_in = 1'b0;  // lsb
    #10;
    #10;

    $finish;
  end

endmodule
