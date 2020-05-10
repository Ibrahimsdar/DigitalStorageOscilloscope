module re_direction(

	input logic a,		// current a and b input from re
	
	input logic b,
	
	input logic clk,  //clk to control flip flops

	input logic increment_select,
	
	input logic reset_n,
	
	output logic [15:0] ref_level

);
	
	
	logic [1:0] a_debounced;
	logic [1:0] b_debounced;
	logic [15:0] count;
	logic [15:0] next_count;
	logic [15:0] old_count;
	logic [15:0] next_ref_level;
	
	logic [15:0]	increment;

	
	//always_comb ref_level = ref_level1;
	
	always_comb
		begin
			if(increment_select)
				begin
					increment = 15'd50;	
				end
			else
				begin
					increment = 15'd1;
				end
		end
	
	
	always_ff@(posedge clk)//a goes through flip flop to debounce
		begin
			a_debounced <= {a_debounced[0],a};
			b_debounced <= {b_debounced[0],b};
		end
		
	always_ff@(posedge a_debounced[1])
		begin
			if(~reset_n)
				begin
					ref_level <= 15'd0;
					count <= 15'd0;
				end
			else
				begin
					ref_level <= next_ref_level;
					count <= next_count;
				end
		end
	always_ff@(posedge a_debounced[1])	//check for rising edge of a_debounced
		begin//ff
		
			if(~b_debounced[1])begin	//if b is 0 then we are moving CW, increment ref_level
					if(count < 16'd20000) next_count <= count + 16'b1;
			end
			else begin//if b is 1 on rising edge of a_debounce, we are going ccw
					if(count > 16'd0) next_count <= count - 16'b1;
			end
	

		end//ff
		
	always_ff@(posedge a_debounced[1])
		begin
			if(count == old_count + 16'd2)
				begin
					old_count <= count;
					if(ref_level < 16'd10000)
						begin
							next_ref_level <= ref_level + increment;
						end
				end
			else if(count == old_count - 16'd2)
				begin
					old_count <= count;
					if(ref_level > 16'd0)
						begin
							next_ref_level <= ref_level - increment;
						end
				end
			else
				begin
				end
		end



		
endmodule 



	