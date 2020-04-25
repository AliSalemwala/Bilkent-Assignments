`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/01/2017 07:14:12 PM
// Module Name: FullAdderTestbench
//////////////////////////////////////////////////////////////////////////////////


module FullAdderTestbench(
    );

    logic x, y, cin;
    logic sum, cout;
    
    FullAdder adder(x, y, cin, sum, cout);
    
    initial begin
        # 5;
        x = 0; y = 0; cin = 0; # 5;
        x = 0; y = 0; cin = 1; # 5;
        x = 0; y = 1; cin = 0; # 5;
        x = 0; y = 1; cin = 1; # 5;
        x = 1; y = 0; cin = 0; # 5;
        x = 1; y = 0; cin = 1; # 5;
        x = 1; y = 1; cin = 0; # 5;
        x = 1; y = 1; cin = 1; # 5;
    end
endmodule