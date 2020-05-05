module time_definer(clk50, base, dir, rst);

input 	logic				clk50;
input		logic	[1:0]		dir;
output	logic	[2:0]		base;
output	logic				rst;

initial begin
	base = 3'd0;
	rst = 1'd1;
end

always_ff @(posedge clk50)
begin
  if(dir == 2'b10) begin // right -> zoom in -> less samples -> less sample rate -> max 7
		if(base <= 3'd6) begin
			base <= base + 3'd1;
			rst <= 1'd1;
		end
		else rst <= 1'd0;
  end
  else if(dir == 2'b01) begin // lift -> zoom out -> more samples -> more sample rate -> min 0
		if(base >= 3'd1) begin
			base <= base - 3'd1;
			rst <= 1'd1;
		end
		else rst <= 1'd0;
  end
  else rst <= 1'd0;
end

endmodule
