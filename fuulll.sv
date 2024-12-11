module full_adder(input logic A, B, cin, output logic sum, cout);
    logic s1;
    logic c1;
    logic c2;
    
    half_adder inst1(A, B, s1, c1);
    half_adder inst2(cin, s1, sum, c2);
    
    assign cout = c1 | c2;
endmodule

