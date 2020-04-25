`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 04/01/2017 07:50:14 PM
// Module Name: TwoBitAdderTestbench
//////////////////////////////////////////////////////////////////////////////////


module TwoBitAdderTestbench(
    );

    logic x, y, a, b, cin;
    logic sum1, sum2, cout;
        
    TwoBitAdder adder(x, y, a, b, cin, sum1, sum2, cout);
        
    initial begin
        # 5;
        x = 0; y = 0; a = 0; b = 0; cin = 0; # 5;
        x = 0; y = 0; a = 0; b = 0; cin = 1; # 5;
        x = 0; y = 0; a = 0; b = 1; cin = 0; # 5;
        x = 0; y = 0; a = 0; b = 1; cin = 1; # 5;
        x = 0; y = 0; a = 1; b = 0; cin = 0; # 5;
        x = 0; y = 0; a = 1; b = 0; cin = 1; # 5;
        x = 0; y = 0; a = 1; b = 1; cin = 0; # 5;
        x = 0; y = 0; a = 1; b = 1; cin = 1; # 5;
        x = 0; y = 1; a = 0; b = 0; cin = 0; # 5;
        x = 0; y = 1; a = 0; b = 0; cin = 1; # 5;
        x = 0; y = 1; a = 0; b = 1; cin = 0; # 5;
        x = 0; y = 1; a = 0; b = 1; cin = 1; # 5;
        x = 0; y = 1; a = 1; b = 0; cin = 0; # 5;
        x = 0; y = 1; a = 1; b = 0; cin = 1; # 5;
        x = 0; y = 1; a = 1; b = 1; cin = 0; # 5;
        x = 0; y = 1; a = 1; b = 1; cin = 1; # 5;
        x = 1; y = 0; a = 0; b = 0; cin = 0; # 5;
        x = 1; y = 0; a = 0; b = 0; cin = 0; # 5;
        x = 1; y = 0; a = 0; b = 0; cin = 1; # 5;
        x = 1; y = 0; a = 0; b = 1; cin = 0; # 5;
        x = 1; y = 0; a = 0; b = 1; cin = 1; # 5;
        x = 1; y = 0; a = 1; b = 0; cin = 0; # 5;
        x = 1; y = 0; a = 1; b = 0; cin = 1; # 5;
        x = 1; y = 0; a = 1; b = 1; cin = 0; # 5;
        x = 1; y = 0; a = 1; b = 1; cin = 1; # 5;
        x = 1; y = 1; a = 0; b = 0; cin = 0; # 5;
        x = 1; y = 1; a = 0; b = 0; cin = 1; # 5;
        x = 1; y = 1; a = 0; b = 1; cin = 0; # 5;
        x = 1; y = 1; a = 0; b = 1; cin = 1; # 5;
        x = 1; y = 1; a = 1; b = 0; cin = 0; # 5;
        x = 1; y = 1; a = 1; b = 0; cin = 1; # 5;
        x = 1; y = 1; a = 1; b = 1; cin = 0; # 5;
        x = 1; y = 1; a = 1; b = 1; cin = 1; # 5;
    end
endmodule