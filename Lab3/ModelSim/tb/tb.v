module detect_tb;
reg clk, rst_n, enter;
reg [0:0]key_a;
reg [0:0]key_b;
wire open;
wire erro;

	detect_seg u0 (
		.key_a(key_a),
		.key_b(key_b),
		.rst_n(rst_n),
		.enter(enter),
		.open(open),
		.erro(erro),
		.clk(clk)
	
	);

initial begin
 clk = 0;
 while (1) begin
   #100;
   clk = ~ clk;
  end
end

initial begin
 $display("---------------");
 @(negedge clk);
 @(negedge clk);
 while (1) begin
 @(posedge clk);
 @(posedge clk);
 @(posedge clk);
 @(posedge clk);
  $display("Open: %d", open);
  $display("Error: %d", erro);
  $display("---------------");

 end
end

initial begin
 while (1) begin
 @(negedge clk);
 @(negedge clk);
 @(posedge clk);
  $display("%d%d", key_a,key_b);
  end
end

initial begin
 enter = 0;
@(negedge clk);
 while (1) begin
 @(negedge clk);
 enter=~ enter;
  end
end

initial begin
      key_a <= 1'b0;
      key_b <= 1'b0;
 while (1) begin
 @(negedge clk);
 @(negedge clk);
  key_a <= $random;
  key_b <= $random;
  end
end



initial begin
 rst_n = 0;
 @(negedge clk);
 rst_n = 1;
end

endmodule
