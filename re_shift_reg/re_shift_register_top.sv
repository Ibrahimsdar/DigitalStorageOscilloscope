module re_shift_register_top(
	input logic clk_50,
	output logic sh_ld,
	output logic clk_inh,
	input logic shift_serial,
	output logic shift_clk,
	
	input logic reset_n,
	
	input logic increment_select,
	
	output logic [31:0] cursors_1,
	
	output logic [31:0] cursors_2
	

	//output logic [7:0] re_directions
	

);

	logic [15:0] count;
	logic [15:0] count_up;
	logic clk_en;
	logic reset_count;

	 logic [1:0] re_1;
	 logic [1:0] re_2;
	 logic [1:0] re_3;
	 logic [1:0] re_4;
	 
	 logic [15:0] ch_1_left;
	 logic [15:0] ch_1_right;
	 logic [15:0] ch_2_left;
	 logic [15:0] ch_2_right;
	 

	always_comb
		begin
			count_up = 16'd500;
			
			clk_en=1'b1;
			
			cursors_1 = {ch_1_left,ch_1_right};
			
			cursors_2 = {ch_2_left,ch_2_right};
		end
		

	
clock_counter clock_counter(
		
		.clk_in(clk_50),		//50 Mhz clock in
		
		.reset_n(reset_n),		//reset
	
		.clk_en(clk_en),
	
		.count_up(count_up),
	
		.clk_slow(shift_clk)	//25Mhz clock for sckl
	
	
);


shift_register_controller shift_register_controller(
		
		.clk(shift_clk),
		.sh_ld(sh_ld),
		.clk_inh(clk_inh),
		.shift_serial(shift_serial),
	
		.re_1(re_1),
		.re_2(re_2),
		.re_3(re_3),
		.re_4(re_4),
	
		.count(count),
	
		.reset_n(reset_n),
	
		.reset_count(reset_count)

);

re_direction re_dir_1(

		.a(re_1[0]),		// current a and b input from re
	
		.b(re_1[1]),
	
		.clk(sh_ld),  //clk to control flip flops
		
		.increment_select(increment_select),
	
		.ref_level(ch_1_right),
		
		.reset_n(reset_n)

);

re_direction re_dir_2(

		.a(re_2[0]),		// current a and b input from re
	
		.b(re_2[1]),
	
		.clk(sh_ld),  //clk to control flip flops
	
		.increment_select(increment_select),
	
		.ref_level(ch_1_left),
		
		.reset_n(reset_n)

);

re_direction re_dir_3(

		.a(re_3[0]),		// current a and b input from re
	
		.b(re_3[1]),
	
		.clk(sh_ld),  //clk to control flip flops
	
		.increment_select(increment_select),
	
		.ref_level(ch_2_left),
		
		.reset_n(reset_n)

);	

re_direction re_dir_4(

		.a(re_4[0]),		// current a and b input from re
	
		.b(re_4[1]),
	
		.clk(sh_ld),  //clk to control flip flops
	
		.increment_select(increment_select),
	
		.ref_level(ch_2_right),
		
		.reset_n(reset_n)

);	

counter counter(
		
		.clk(shift_clk),
	
		.reset_n(reset_count),
	
		.count(count)
	
);
endmodule