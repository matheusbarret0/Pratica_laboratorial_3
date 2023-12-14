module gerador_de_sinais #(
  parameter WIDTH = 12 // número de bits para o sinal de saída
) (
  input clk, // sinal de clock
  input reset, // sinal de reset
  input [1:0] sel, // seleção do tipo de sinal
  output reg [WIDTH-1:0] out // sinal de saída
);

reg [WIDTH-1:0] square_out;
reg [WIDTH-1:0] triangular_out;
reg [WIDTH-1:0] sawtooth_out;

gerador_onda_quadrada #(
  .WIDTH(WIDTH)
) square_generator (
  .clk(clk),
  .reset(reset),
  .out(square_out)
);

gerador_onda_triangular #(
  .WIDTH(WIDTH)
) triangular_generator (
  .clk(clk),
  .reset(reset),
  .out(triangular_out)
);

gerador_onda_dente_de_serra #(
  .WIDTH(WIDTH)
) sawtooth_generator (
  .clk(clk),
  .reset(reset),
  .out(sawtooth_out)
);

always @* begin
  case (sel)
    2'b00: out = square_out;
    2'b01: out = triangular_out;
    2'b10: out = sawtooth_out;
    default: out = 0;
  endcase;
end

endmodule

