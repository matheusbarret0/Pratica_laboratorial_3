module gerador_onda_dente_de_serra #(
  parameter WIDTH = 1 // n�mero de bits para o sinal de sa�da
) (
  input clk, // sinal de clock
  input reset, // sinal de reset
  output reg [WIDTH-1:0] out // sinal de sa�da
);

reg [WIDTH-1:0] count; // contador da onda dente de serra

always @(posedge clk or posedge reset) begin
  if (reset) begin
    count <= 0;
    out <= 0;
  end else begin
    count <= count + 1;
    out <= count;
  end
end

endmodule

