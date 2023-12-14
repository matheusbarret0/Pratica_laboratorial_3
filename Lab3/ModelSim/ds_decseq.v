module detect_seg (
input clk,
input [0:0] key_a,
input [0:0] key_b,
input rst_n,
input enter,
output reg open,
output reg erro);

localparam [2:0] B1 = 3'b000,
		 B2 = 3'b001,
		 B3 = 3'b010,
		 preerro = 3'b011,
		 errofinal = 3'b100;
		 
reg [2:0] proximo_estado;
reg [2:0] estado;

//Logica combinacional de proximo estado
always @ (*) begin
	if (estado == B1 && enter == 1) 
		if(key_a == 1'b0 && key_b == 1'b1)
			proximo_estado = B2;
		else
			proximo_estado = preerro;
	
	else if (estado == B2 && enter == 1) 
		if(key_a == 1'b1 && key_b == 1'b1)
			proximo_estado = B3;
		else
			proximo_estado = errofinal;

	else if (estado == preerro && enter == 1) 
		proximo_estado = errofinal;

	else if (estado == errofinal || estado == B3 )
		proximo_estado = B1;

	else
		proximo_estado = estado;
end

// Estado  
always @( posedge clk or negedge rst_n ) begin
   if (~rst_n)
	estado <= B1;
   else 
	estado <= proximo_estado;

end


//Logica combinacional de saida
always @(*) begin
   case(estado)
      B1: begin
          open = 0;
          erro = 0;
      end
      B2: begin
          open = 0;
          erro = 0;
      end
      B3: begin
          open = 1;
          erro = 0;
      end
      preerro: begin
          open = 0;
          erro = 0;
      end
      errofinal: begin
          open = 0;
          erro = 1;
      end
      default: begin
          open = 0;
          erro = 0;
      end
   endcase
end

endmodule
