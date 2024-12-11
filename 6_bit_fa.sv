module six_bit_adder(input logic [5:0] a,[5:0] b, cin, output logic [5:0] sum, carry_out);
    logic [5:0] carry;

    full_adder f_a1(a[0], b[0], cin, sum[0], carry[0]);
    full_adder f_a2(a[1], b[1], carry[0], sum[1], carry[1]);
    full_adder f_a3(a[2], b[2], carry[1], sum[2], carry[2]);
    full_adder f_a4(a[3], b[3], carry[2], sum[3], carry[3]);
    full_adder f_a5(a[4], b[4], carry[3], sum[4], carry[4]);
    full_adder f_a6(a[5], b[5], carry[4], sum[5], carry[5]);

    assign carry_out = carry[5];
endmodule

module tb_six_bit_adder;
    logic [5:0] A, B;
    logic cin;
    logic [5:0] sum;
    logic carry_out;

    six_bit_adder uut (
        .a(A),
        .b(B),
        .cin(cin),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        A = 6'b011110; 
        B = 6'b000011; 
        cin = 0;
        #10;
        $display("A = %b, B = %b, Sum = %b, Carry_out = %b", A, B, sum, carry_out);
        
      
        A = 6'b111111; 
        B = 6'b100000; 
        cin = 1;
        #10;
        $display("A = %b, B = %b, Sum = %b, Carry_out = %b", A, B, sum, carry_out);
        
       
        A = 6'b000000;
        B = 6'b000000;
        cin = 0;
        #10;
        $display("A = %b, B = %b, Sum = %b, Carry_out = %b", A, B, sum, carry_out);
        
        
        A = 6'b111110; 
        B = 6'b111111; 
        cin = 0;
        #10;
        $display("A = %b, B = %b, Sum = %b, Carry_out = %b", A, B, sum, carry_out);
    end
endmodule

