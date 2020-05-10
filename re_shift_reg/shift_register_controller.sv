module shift_register_controller(
	input logic clk,
	output logic sh_ld,
	output logic clk_inh,
	input logic shift_serial,
	
	output logic [1:0] re_1,
	output logic [1:0] re_2,
	output logic [1:0] re_3,
	output logic [1:0] re_4,
	
	input logic [15:0] count,
	
	input logic reset_n,
	
	output logic reset_count
	


);
	logic [7:0] q;
	logic [7:0] re_register;
	logic state;
	logic next_state;
	
	parameter load = 1'd0;
	parameter shift = 1'd1;
	
	
	
	always_ff@(posedge clk,negedge reset_n)		//state register
		begin
			if(~reset_n)
				begin
					state <= 1'b0;
				end
			else
				begin
					state <= next_state;
				end
		end
		
		
		
		always_comb		//next state logic
			begin
				case(state)
					load:next_state = shift;
					shift:begin
						if(count < 4'd7)
							begin
								next_state = shift;
							end
						else
							begin
								next_state = load;
							end
						
					end
					default:next_state = shift;
				endcase
				
				clk_inh=1'b0;
			end
			
		
		
		always_comb //output logic
			begin
				case(state)
					load:begin
						sh_ld = 1'b0;
						reset_count =1'b0;
					end
					shift:begin
						sh_ld = 1'b1;
						reset_count = 1'b1;
					end
					default:begin
						sh_ld= 1'b0;
						reset_count = 1'b0;
					end
				endcase
			end
			
		
		
		always_ff@(posedge clk)
			begin
				case(state)
					load:begin
						q<= q;
						re_register <= q;
					end
					shift:begin
						q <= {q[7:0],shift_serial};
						re_register <= re_register;
					end
					default:begin
						q<=q;
						re_register<= re_register;
					end
				endcase
			end
			
		always_comb
			begin
				re_1 = re_register[1:0];
				re_2 = re_register[3:2];
				re_3 = re_register[5:4];
				re_4 = re_register[7:6];
			end
	

	

endmodule