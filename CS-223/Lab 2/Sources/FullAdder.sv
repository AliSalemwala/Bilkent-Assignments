`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/01/2017 07:05:29 PM
// Module Name: FullAdder
//////////////////////////////////////////////////////////////////////////////////


module FullAdder(
    input logic x, y, cin,
    output logic sum, cout
    );
    
    assign xXORY = x ^ y;
    assign sum = xXORY ^ cin;
    assign cout = ((x & y) | (xXORY & cin));
    
endmodule