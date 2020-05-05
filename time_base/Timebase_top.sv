// Ibrahim alarifi
module Timebase_top(
	clk50, 
	quadA, 
	quadB, 
	ADC_clk, 
	base, 
	quadA2, 
	quadB2, 
	ADC_clk2, 
	base2,
	en_clk,
	en_clk2,
	dev_clk
);

input 	logic				clk50;
input 	logic				quadA;
input 	logic				quadB;
input		logic				en_clk;
output	logic				ADC_clk;
output	logic	[2:0]		base;

input 	logic				quadA2;
input 	logic				quadB2;
input		logic				en_clk2;
output	logic				ADC_clk2;
output	logic	[2:0]		base2;

output	logic				dev_clk;


logic				[1:0] 	dir;
logic							rst;
logic				[1:0] 	dir2;
logic							rst2;

assign dev_clk = clk50;

// *** CHANNEL 1 *** //
quad	quad_dec(
	.clk50(clk50), 
	.quadA(quadA), 
	.quadB(quadB), 
	.dir(dir)
);

time_definer	timebase_def(
	.clk50(clk50), 
	.base(base), 
	.dir(dir), 
	.rst(rst)
);

clock_devider	clk_dev(
	.clk50(clk50),
	.enable(en_clk),
	.rst(rst), 
	.base(base), 
	.ADC_clk(ADC_clk)
);


// *** CHANNEL 2 *** //
quad	quad_dec2(
	.clk50(clk50), 
	.quadA(quadA2), 
	.quadB(quadB2), 
	.dir(dir2)
);

time_definer	timebase_def2(
	.clk50(clk50), 
	.base(base2), 
	.dir(dir2), 
	.rst(rst2)
);

clock_devider	clk_dev2(
	.clk50(clk50), 
	.enable(en_clk2),
	.rst(rst2), 
	.base(base2), 
	.ADC_clk(ADC_clk2)
);

endmodule
