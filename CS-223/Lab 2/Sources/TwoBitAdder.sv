`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/01/2017 07:38:52 PM
// Module Name: TwoBitAdder
//////////////////////////////////////////////////////////////////////////////////


module TwoBitAdder(
    input logic x, y, a, b, cin,
    output logic sum1, sum2, cout 
    );
    
    logic midCarry;
    FullAdder firstAdder (x, y, cin, sum1, midCarry);
    FullAdder secondAdder (a, b, midCarry, sum2, cout); 
endmodule
