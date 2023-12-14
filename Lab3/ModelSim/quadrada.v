
module gerador_onda_quadrada #(
  parameter WIDTH = 1 // número de bits para o sinal de saída
) (
  input clk, // sinal de clock
  input reset, // sinal de reset
  output reg [WIDTH-1:0] out // sinal de saída
);

reg [31:0] count; // contador de ciclos

always @(posedge clk or posedge reset) begin
  if (reset) begin
    count <= 0;
    out <= 0;
  end else begin
    count <= count + 1;
    if (count == 100) begin // período da onda quadrada = 100 ciclos
      count <= 0;
      out <= ~out; // alternar entre 0 e 1
    end
  end
end

endmodule
