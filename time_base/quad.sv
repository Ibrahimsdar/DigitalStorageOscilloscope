// Ibrahim alarifi
module quad(clk50, quadA, quadB, dir);

input 	logic				clk50;
input 	logic				quadA;
input 	logic				quadB;
output	logic	[1:0] 	dir;

logic 	[2:0] 		quadA_delayed, quadB_delayed;

always @(posedge clk50) quadA_delayed <= {quadA_delayed[1:0], quadA};
always @(posedge clk50) quadB_delayed <= {quadB_delayed[1:0], quadB};

wire 	count_enable = quadA_delayed[1] ^ quadA_delayed[2] ^ quadB_delayed[1] ^ quadB_delayed[2];
wire 	count_direction = quadA_delayed[1] ^ quadB_delayed[2];

logic 	[7:0] 	count;
logic		[7:0]		old;

initial begin
	count <= 8'd0;
	old	<= 8'd0;
end

always_ff @(posedge clk50)
begin
  if(count_enable)
  begin
    if(count_direction) count<=count+8'd1; // right detection
	 else count<=count-8'd1;					 // lift detection
	 
	 if(count == old + 8'd4) begin			 // right direction
		dir <= 2'b10;
		old <= count;
	 end
	 else if(count == old - 8'd4) begin		 // lift direction
		dir <= 2'b01;
		old <= count;
	 end
	 else dir <= 2'b00; ///
  end
  else dir <= 2'b00;
end

endmodule
