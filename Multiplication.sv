module multiplier_shift_add_signed (
    input logic signed [5:0] A,  
    input logic signed [5:0] B,  
    output logic signed [11:0] product  
);
    logic [11:0] p1;  
    logic [5:0] multiplier;     
    logic [11:0] multiplicand;  
    logic sign;

    always_comb begin
        p1 = 12'b0;      
        sign = A[5] ^ B[5]; 
        multiplier = A[5] ? ~A + 1 : A; 
        multiplicand = B[5] ? ~B + 1 : B;
        multiplicand = {6'b0, multiplicand};
        for (int i = 0; i < 6; i++) begin
            if (multiplier[0]) begin
                p1 = p1 + multiplicand;
            end
            multiplicand = multiplicand << 1;  
            multiplier = multiplier >> 1;      
        end
        product = sign ? ~p1 + 1 : p1;
    end
endmodule

module tb_multiplier_shift_add_signed;
    
    logic signed [5:0] A, B;
    logic signed [11:0] product;

   
    multiplier_shift_add_signed uut (
        .A(A),
        .B(B),
        .product(product)
    );

    initial begin
       
        A = 6'b001101; 
        B = 6'b000111; 
        #10;
        $display("A = %d, B = %d, Product = %d", A, B, product);
        
        
        A = 6'b111101; 
        B = 6'b000100; 
        #10;
        $display("A = %d, B = %d, Product = %d", A, B, product);
        
       
        A = 6'b111010; // -6
        B = 6'b110101; // -11
        #10;
        $display("A = %d, B = %d, Product = %d", A, B, product);
        
       
        A = 6'b000000; // 0
        B = 6'b010101; // 21
        #10;
        $display("A = %d, B = %d, Product = %d", A, B, product);
    end
endmodule
