module gerador_onda_triangular #(
  parameter WIDTH = 1 // n�mero de bits para o sinal de sa�da
) (
  input clk, // sinal de clock
  input reset, // sinal de reset
  output reg [WIDTH-1:0] out // sinal de sa�da
);

reg [WIDTH-1:0] count; // contador de n�veis da onda triangular
reg [WIDTH-1:0] increment; // incremento do contador

always @ (posedge clk) begin
  if (reset) begin
    count <= 0;
    down <= 1'b0;
  end else begin
    if (count == WIDTH-1) begin
      down <= 1'b1;
    end else if (count == 0) begin
      down <= 1'b0;
    end
    if (down) begin
      count <= count - 1;
    end else begin
      count <= count + 1;
    end
  end
end


endmodule

