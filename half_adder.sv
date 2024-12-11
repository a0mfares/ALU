module half_adder(input logic A, B, output logic sum, c);
    assign sum = A ^ B;
    assign c = A & B;
endmodule
