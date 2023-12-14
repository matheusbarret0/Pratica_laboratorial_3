module tb_gerador_de_sinais;

reg clk, reset;
reg [1:0] sel;
wire [11:0] out;

gerador_de_sinais #(
  .WIDTH(12)
) dut (
  .clk(clk),
  .reset(reset),
  .sel(sel),
  .out(out)
);

always #5 clk = ~clk;

initial begin
  clk = 0;
  reset = 1;
  sel = 0;
  #10 reset = 0;
  #100;

  sel = 1;
  #100 sel = 2;
  #100 sel = 0;
  #100 sel = 1;
  #100 sel = 2;
  #100;
end

endmodule

