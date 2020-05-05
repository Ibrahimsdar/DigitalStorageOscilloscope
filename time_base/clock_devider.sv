// Ibrahim alarifi
module clock_devider(clk50, enable, rst, base, ADC_clk);

input 	logic				clk50;
input		logic 			enable;
input		logic				rst;
input		logic	[2:0]		base;
output	logic				ADC_clk;


logic				[7:0]		c_count;
logic				[7:0]		counter;

always_ff @(posedge clk50, posedge rst, negedge enable) // clock devider
begin
	if(enable == 1'd0) begin
		ADC_clk <= 1'd1;
	end
	else begin
		if(rst == 1'd1) begin // update the value of the c_count with the new value and reset counter
			counter <= 8'd0;
			ADC_clk <= 1'd0;
			if(base == 3'd0) c_count <= 8'd2;			// max clk 12.5MHz
			else if(base == 3'd1) c_count <= 8'd4;		// 6.25MHz
			else if(base == 3'd2) c_count <= 8'd8;		// 3.125MHz
			else if(base == 3'd3) c_count <= 8'd16;	// 1.56MHz
			else if(base == 3'd4) c_count <= 8'd32;	// 780KHz
			else if(base == 3'd5) c_count <= 8'd64;	// 390KHz
			else if(base == 3'd6) c_count <= 8'd128;	// 195Khz
			else if(base == 3'd7) c_count <= 8'd255;	// min clk 98KHz
		end
		else if (counter == c_count - 8'd1) begin
			counter <= 8'd0;
			ADC_clk <= ~ADC_clk;
		end
		else begin
        ADC_clk <= ADC_clk;
		  counter <= counter + 8'd1;
	end
	end
  
end

endmodule
