// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Mon Jun 17 20:35:29 2013
// ============================================================================

`define ENABLE_HPS

module DE1_SOC_golden_top(


		/////CHANNEL ONE//////
		
		input wire [7:0] adc_samples_1,	//samples from adc
		//
		input trigger_1,			//signal from trigger
		
		output wire adc_clk_1,		//clk enable to time base
	
		/////CHANNEL TWO//////
		
		input wire [7:0] adc_samples_2,
		
		input wire trigger_2,
		
		output wire adc_clk_2,
	
			
		//DAC SPI MOSI//////
		
		output wire sclk,
	
		output wire sdata,
			
		output wire cs_n,
		
		////RE SHIFT REGISTER////
		output wire sh_ld,
	   output wire clk_inh,
	   input wire shift_serial,
	   output wire shift_clk,
	
		
				
		//////Rotary encoders///
		
		input wire re_trigger_a1,///trigger level
		input wire re_trigger_b1,
		input wire re_trigger_a2,
		input wire re_trigger_b2,
		
		input wire re_time_a1,		///time base
		input wire re_time_b1,
		input wire re_time_a2,
		input wire re_time_b2,


      ///////// ADC /////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      //inout     [35:0]         GPIO_0,
      //inout     [35:0]         GPIO_1,
 

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output   [9:0]  LEDR,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW /////////
      inout       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,

      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS,
		///////// MTL /////////
	   output		[7:0]     MTL_B,
      output		       MTL_DCLK,
      output		[7:0]  MTL_G,
      output		       MTL_HSD,
      output		[7:0]  MTL_R,
      output		       MTL_TOUCH_I2C_SCL,
      inout 		       MTL_TOUCH_I2C_SDA,
      input 		       MTL_TOUCH_INT_n,
      output		       MTL_VSD
);


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire HEX0P;
wire HEX1P;
wire HEX2P;
wire HEX3P;
wire HEX4P;
wire HEX5P;

wire underflow_from_the_alt_vip_itc_0;
wire vid_datavalid_from_the_alt_vip_itc_0;
//wire clk_vga;
wire nios_td_reset_n;
wire reset_n;

wire  uart_txd;


wire hps_fpga_reset_n;
wire               clk_33;
wire [7:0]         vid_r,vid_g,vid_b;
wire               vid_v_sync ;
wire               vid_h_sync ;
//=======================================================
//  Structural coding
//=======================================================


// MTL - display
assign {MTL_R,MTL_G,MTL_B} = {vid_r, vid_g, vid_b};
assign MTL_DCLK = clk_33;
assign MTL_HSD = ~vid_h_sync;
assign MTL_VSD = ~vid_v_sync;

assign reset_n = 1'b1;

///////////////////////
// VGA



///////////////////////
// TV Decoder
assign TD_RESET_N = reset_n & nios_td_reset_n;

///////////////////////////////////////////




	//wire adc_clk_1; 				//ch1
	wire [7:0] write_data_1;
	wire [16:0] address_1;
	wire clk_en_1;
	wire cs_1;
	wire write_1;
	
	wire adc_clk_en_1;
	
	//wire adc_clk_2; 				//ch2
	wire [7:0] write_data_2;
	wire [16:0] address_2;
	wire clk_en_2;
	wire cs_2;
	wire write_2;
	
	wire adc_clk_en_2;
	
	wire [7:0] ref_level_1;	 //status
	wire [7:0] ref_level_2;
	wire [5:0] time_base;
	wire [31:0] oscope_status;
	
	wire [7:0] re_directions;
	
	wire [31:0] cursors_1;
	
	wire [31:0] cursors_2;
	
	//assign LEDR[7:0] = re_directions;
	
	//always@(*)
		//begin
			// adc_clk_1 = adc_clk_2;
		//end
	
	
	
	
	//////////////Shift REGister RE//////////////
re_shift_register_top re_shift_register_top(
		.clk_50(CLOCK_50),
		.sh_ld(sh_ld),
		.clk_inh(clk_inh),
		.shift_serial(shift_serial),
		.shift_clk(shift_clk),
	
	    .reset_n(hps_fpga_reset_n),
		 
		.increment_select(SW[2]),
	
		.cursors_1(cursors_1),
			
		.cursors_2(cursors_2)
	
	

	  //  .re_directions(re_directions)
	

);
	
	////////////////////TIME BASE////////////////////
Timebase_top Timebase_top(
	.clk50(CLOCK_50), 
	.quadA(re_time_a1), 
	.quadB(re_time_b1), 
	.ADC_clk(adc_clk_1), 
	.base(time_base[2:0]), 
	.quadA2(re_time_a2), 
	.quadB2(re_time_b2), 
	.ADC_clk2(adc_clk_2), 
	.base2(time_base[5:3]),
	.en_clk(adc_clk_en_1),
	.en_clk2(adc_clk_en_2)
	//.dev_clk
);
	
	
	
	///////////////DATA AQcuisition LOGIC?????????????
		data_aq_top data_aq_top(
			
		.	clk_50(CLOCK_50),
		.	reset_n(hps_fpga_reset_n),
	
	//channel_1
			.adc_clk_1(adc_clk_1),
			.adc_samples_1(adc_samples_1),
			.trigger_1(trigger_1),
	

			.write_data_1(write_data_1),
			.address_1(address_1),
			.clk_en_1(clk_en_1),
			.cs_1(cs_1),
			.write_1(write_1),
	
			.adc_clk_en_1(adc_clk_en_1),

	//channel_2
			.adc_clk_2(adc_clk_1),
			.adc_samples_2(adc_samples_2),
			.trigger_2(trigger_2),
	

			.write_data_2(write_data_2),
			.address_2(address_2),
			.clk_en_2(clk_en_2),
			.cs_2(cs_2),
			.write_2(write_2),
	
			.adc_clk_en_2(adc_clk_en_2),
	
	//status
	
			.ref_level_1(ref_level_1),
	
			.ref_level_2(ref_level_2),
	
			.time_base(time_base),
	
			.oscope_status(oscope_status),
			
			.mode_sel(SW[0]),
			.channel_sel(SW[1]),
			
			.re_directions(re_directions)



);

/////////////////////TRIGGER DAC///////////////////////



		
		//////DAC AND RE////
		


	dac_trigger_top dac_trigger_top(

			.re_a1(re_trigger_a1),
			.re_b1(re_trigger_b1),
			.re_a2(re_trigger_a2),
			.re_b2(re_trigger_b2),
			.clk_50mHz(CLOCK_50),
			.reset_n(1'b1),
	
	
	
//	input logic channel_sel,
	
			.ref_level_1(ref_level_1),
			.ref_level_2(ref_level_2),
	
			.sclk(sclk),
			//GPIO_0[32]),
	
			.sdata(sdata),
			//GPIO_0[30]),
	
			.cs_n(cs_n)
			//GPIO_0[34])


);



interface_test interface_test( 		///test module used to display samples onto seven seg
												//and to test my code

		.clk_50mHZ(CLOCK_50),
	
		.reset_n(hps_fpga_reset_n),
	
		.clk_switch(SW[7]),
		
		.channel_switch(SW[9]),
	
		.x10_1(SW[8]),
		
	//ch1
	
		.digital_volt_1(adc_samples_1),
		
		//.adc_clk_en_1(adc_clk_en_1),
	
		//.clk_adc_1(adc_clk_1),
	//ch_2
	

		.digital_volt_2(adc_samples_2),
	
		//.adc_clk_en_2(adc_clk_en_2),
	
		//.clk_adc_2(adc_clk_2),
	
		//.time_base(time_base),

	//outputs
	
		.h0(HEX0),

		.h1(HEX1),
	
		.h2(HEX2),
	
		.h3(HEX3),
	
		//.dp(dp),
	
		.sign(HEX4[6])
	
	
);
	

	

DE1_SoC_QSYS u0 (


		.clk_adc1_clk                           (adc_clk_1),  
      .clk_adc2_clk                           (adc_clk_1),  
		
		.cursors_1_export                          (cursors_1),                          //                         cursors_1.export
      .cursors_2_export                          (cursors_2),                          //                         cursors_2.export

	
		/////ON CHIP MEMORY 1/////
		
		  .channel_1_mem_address                 (address_1),                 //             channel_1_mem.address
        .channel_1_mem_clken                   (clk_en_1),                   //                          .clken
        .channel_1_mem_chipselect              (cs_1),              //                          .chipselect
        .channel_1_mem_write                   (write_1),                   //                          .write
       // .channel_1_mem_readdata                (<connected-to-channel_1_mem_readdata>),                //                          .readdata
        .channel_1_mem_writedata               (write_data_1),               //                          .writedata
       
		/////ON CHIP MEMORY 2///////////
		
			.channel_2_mem_address                 (address_2),                 //             channel_2_mem.address
        .channel_2_mem_clken                   (clk_en_2),                   //                          .clken
        .channel_2_mem_chipselect              (cs_2),              //                          .chipselect
        .channel_2_mem_write                   (write_2),                   //                          .write
       // .channel_2_mem_readdata                (<connected-to-channel_2_mem_readdata>),                //                          .readdata
        .channel_2_mem_writedata               (write_data_2),               //                          .writedata
		  
		  .oscope_status_external_connection_export         (oscope_status),         //    oscope_status_external.export
		  

	 
	 
	 
	 
        .clk_50                                 (CLOCK_50),                                 //                       clk_50_clk_in.clk
        .reset_n                                (reset_n & hps_fpga_reset_n),                                //                 clk_50_clk_in_reset.reset_n
        .clk_sdram_clk                          (DRAM_CLK),                           //                           altpll_c1.clk
        .clk_mtl_clk                            (clk_33 ),                          //                         altpll_0_c2.clk
		  // VGA
        .alt_vip_itc_0_clocked_video_vid_clk           (~clk_33 ),           //         alt_vip_itc_0_clocked_video.vid_clk
        .alt_vip_itc_0_clocked_video_vid_data        ({vid_r, vid_g, vid_b}),        //                                    .vid_data
        .alt_vip_itc_0_clocked_video_underflow       (underflow_from_the_alt_vip_itc_0),       //                                    .underflow
        .alt_vip_itc_0_clocked_video_vid_datavalid   (vid_datavalid_from_the_alt_vip_itc_0),   //                                    .vid_datavalid
        .alt_vip_itc_0_clocked_video_vid_v_sync      (vid_v_sync ),      //                                    .vid_v_sync
        .alt_vip_itc_0_clocked_video_vid_h_sync      (vid_h_sync ),      //                                    .vid_h_sync
        .alt_vip_itc_0_clocked_video_vid_f           (),           //                                    .vid_f
        .alt_vip_itc_0_clocked_video_vid_h           (),           //                                    .vid_h
        .alt_vip_itc_0_clocked_video_vid_v           (),           //                                    .vid_v
		  
        .in_port_to_the_td_status               ({underflow_from_the_alt_vip_itc_0, vid_datavalid_from_the_alt_vip_itc_0}),               //       td_status_external_connection.export
		  // NIOS control
        .out_port_from_the_td_reset_n           (nios_td_reset_n),           //      td_reset_n_external_connection.export
	 				
			// TV Decoder
        .vid_clk_to_the_alt_vip_cti_0           (TD_CLK27),           //         alt_vip_cti_0_clocked_video.vid_clk
        .vid_data_to_the_alt_vip_cti_0          (TD_DATA),          //                                    .vid_data
        .overflow_from_the_alt_vip_cti_0        (),        //                                    .overflow
        .vid_datavalid_to_the_alt_vip_cti_0     (1'b1),     //                                    .vid_datavalid
        .vid_locked_to_the_alt_vip_cti_0        (1'b1),        //                                    .vid_locked
		  
		  // I2C (TV Decoder)
        .out_port_from_the_i2c_scl              (FPGA_I2C_SCLK),              //         i2c_scl_external_connection.export
        .bidir_port_to_and_from_the_i2c_sda     (FPGA_I2C_SDAT),     //         i2c_sda_external_connection.export
		  
			// sdram
        .zs_addr_from_the_sdram                 (DRAM_ADDR),                 //                          sdram_wire.addr
        .zs_ba_from_the_sdram                   (DRAM_BA),                   //                                    .ba
        .zs_cas_n_from_the_sdram                (DRAM_CAS_N),                //                                    .cas_n
        .zs_cke_from_the_sdram                  (DRAM_CKE),                  //                                    .cke
        .zs_cs_n_from_the_sdram                 (DRAM_CS_N),                 //                                    .cs_n
        .zs_dq_to_and_from_the_sdram            (DRAM_DQ),            //                                    .dq
        .zs_dqm_from_the_sdram                  ({DRAM_UDQM,DRAM_LDQM}),                  //                                    .dqm
        .zs_ras_n_from_the_sdram                (DRAM_RAS_N),                //                                    .ras_n
        .zs_we_n_from_the_sdram                 (DRAM_WE_N),                 //                                    .we_n	
		  //hex
		//  .seg7_conduit_end_export               ({HEX5P, HEX5, HEX4P, HEX4,
		                                         //  HEX3P, HEX3, HEX2P, HEX2,
		  													   // HEX1P, HEX1, HEX0P, HEX0  }),           //           seg7_conduit_end.export
		  
		  //pio
		 // .sw_external_connection_export         (SW),     //     sw_external_connection.export
		//  .ledr_external_connection_export       (LEDR),
		  .key_external_connection_export        (KEY),     //   ledr_external_connection.export
        
		  //adc
		  .spi_0_external_MISO                   (ADC_DOUT),                     //                 spi_0_external.MISO
		  .spi_0_external_MOSI                   (ADC_DIN),                     //                               .MOSI
		  .spi_0_external_SCLK                   (ADC_SCLK),                     //                               .SCLK
		  .spi_0_external_SS_n                   (ADC_CS_N),                     //                               .SS_n
		
		  //audio
		  .audio_conduit_end_XCK                 (AUD_XCK),                   //              audio_conduit_end.XCK
		  .audio_conduit_end_ADCDAT              (AUD_ADCDAT),                //                               .ADCDAT
		  .audio_conduit_end_ADCLRC              (AUD_ADCLRCK),                //                               .ADCLRC
		  .audio_conduit_end_DACDAT              (AUD_DACDAT),                //                               .DACDAT
		  .audio_conduit_end_DACLRC              (AUD_DACLRCK),                //                               .DACLRC
		  .audio_conduit_end_BCLK                (AUD_BCLK),                  //                               .BCLK
		 
		  // IR
        .ir_rx_conduit_end_export              (IRDA_RXD),                   //              ir_rx_conduit_end.export
		 
		  .uart_external_connection_rxd          (ir_loopback),            //       uart_external_connection.rxd   IRDA_RXD
		  .uart_external_connection_txd          (uart_txd),            //                               .txd
		  //touch
		  .interrupt_pio_external_connection_export  (MTL_TOUCH_INT_n ),  // interrupt_pio_external_connection.export
        .touch_i2c_conduit_start_scl_pad_io        (MTL_TOUCH_I2C_SCL ),        //           touch_i2c_conduit_start.scl_pad_io
        .touch_i2c_conduit_start_sda_pad_io        (MTL_TOUCH_I2C_SDA ),         //                                  .sda_pad_io
		//////////////////////////
		// HPS
		
        .hps_0_h2f_reset_reset_n               ( hps_fpga_reset_n ),                //                hps_0_h2f_reset.reset_n
		  
        .memory_mem_a                          ( HPS_DDR3_ADDR),                          //          memory.mem_a
        .memory_mem_ba                         ( HPS_DDR3_BA),                         //                .mem_ba
        .memory_mem_ck                         ( HPS_DDR3_CK_P),                         //                .mem_ck
        .memory_mem_ck_n                       ( HPS_DDR3_CK_N),                       //                .mem_ck_n
        .memory_mem_cke                        ( HPS_DDR3_CKE),                        //                .mem_cke
        .memory_mem_cs_n                       ( HPS_DDR3_CS_N),                       //                .mem_cs_n
        .memory_mem_ras_n                      ( HPS_DDR3_RAS_N),                      //                .mem_ras_n
        .memory_mem_cas_n                      ( HPS_DDR3_CAS_N),                      //                .mem_cas_n
        .memory_mem_we_n                       ( HPS_DDR3_WE_N),                       //                .mem_we_n
        .memory_mem_reset_n                    ( HPS_DDR3_RESET_N),                    //                .mem_reset_n
        .memory_mem_dq                         ( HPS_DDR3_DQ),                         //                .mem_dq
        .memory_mem_dqs                        ( HPS_DDR3_DQS_P),                        //                .mem_dqs
        .memory_mem_dqs_n                      ( HPS_DDR3_DQS_N),                      //                .mem_dqs_n
        .memory_mem_odt                        ( HPS_DDR3_ODT),                        //                .mem_odt
        .memory_mem_dm                         ( HPS_DDR3_DM),                         //                .mem_dm
        .memory_oct_rzqin                      ( HPS_DDR3_RZQ),                      //                .oct_rzqin

		  
	     .hps_io_hps_io_emac1_inst_TX_CLK ( HPS_ENET_GTX_CLK), //                   hps_0_hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   ( HPS_ENET_TX_DATA[0] ),   //                               .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   ( HPS_ENET_TX_DATA[1] ),   //                               .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   ( HPS_ENET_TX_DATA[2] ),   //                               .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   ( HPS_ENET_TX_DATA[3] ),   //                               .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   ( HPS_ENET_RX_DATA[0] ),   //                               .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   ( HPS_ENET_MDIO ),   //                               .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    ( HPS_ENET_MDC  ),    //                               .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL ( HPS_ENET_RX_DV), //                               .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL ( HPS_ENET_TX_EN), //                               .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK ( HPS_ENET_RX_CLK), //                               .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   ( HPS_ENET_RX_DATA[1] ),   //                               .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   ( HPS_ENET_RX_DATA[2] ),   //                               .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   ( HPS_ENET_RX_DATA[3] ),   //                               .hps_io_emac1_inst_RXD3
        
		  
		  .hps_io_hps_io_qspi_inst_IO0     ( HPS_FLASH_DATA[0]    ),     //                               .hps_io_qspi_inst_IO0
        .hps_io_hps_io_qspi_inst_IO1     ( HPS_FLASH_DATA[1]    ),     //                               .hps_io_qspi_inst_IO1
        .hps_io_hps_io_qspi_inst_IO2     ( HPS_FLASH_DATA[2]    ),     //                               .hps_io_qspi_inst_IO2
        .hps_io_hps_io_qspi_inst_IO3     ( HPS_FLASH_DATA[3]    ),     //                               .hps_io_qspi_inst_IO3
        .hps_io_hps_io_qspi_inst_SS0     ( HPS_FLASH_NCSO    ),     //                               .hps_io_qspi_inst_SS0
        .hps_io_hps_io_qspi_inst_CLK     ( HPS_FLASH_DCLK    ),     //                               .hps_io_qspi_inst_CLK
        
		  .hps_io_hps_io_sdio_inst_CMD     ( HPS_SD_CMD    ),     //                               .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      ( HPS_SD_DATA[0]     ),      //                               .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      ( HPS_SD_DATA[1]     ),      //                               .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     ( HPS_SD_CLK   ),     //                               .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      ( HPS_SD_DATA[2]     ),      //                               .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      ( HPS_SD_DATA[3]     ),      //                               .hps_io_sdio_inst_D3
        	
		  .hps_io_hps_io_usb1_inst_D0      ( HPS_USB_DATA[0]    ),      //                               .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      ( HPS_USB_DATA[1]    ),      //                               .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      ( HPS_USB_DATA[2]    ),      //                               .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      ( HPS_USB_DATA[3]    ),      //                               .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4      ( HPS_USB_DATA[4]    ),      //                               .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      ( HPS_USB_DATA[5]    ),      //                               .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      ( HPS_USB_DATA[6]    ),      //                               .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      ( HPS_USB_DATA[7]    ),      //                               .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     ( HPS_USB_CLKOUT    ),     //                               .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     ( HPS_USB_STP    ),     //                               .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     ( HPS_USB_DIR    ),     //                               .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     ( HPS_USB_NXT    ),     //                               .hps_io_usb1_inst_NXT
        		  
		  .hps_io_hps_io_spim1_inst_CLK    ( HPS_SPIM_CLK  ),    //                               .hps_io_spim1_inst_CLK
        .hps_io_hps_io_spim1_inst_MOSI   ( HPS_SPIM_MOSI ),   //                               .hps_io_spim1_inst_MOSI
        .hps_io_hps_io_spim1_inst_MISO   ( HPS_SPIM_MISO ),   //                               .hps_io_spim1_inst_MISO
        .hps_io_hps_io_spim1_inst_SS0    ( HPS_SPIM_SS ),    //                               .hps_io_spim1_inst_SS0
      	
		  .hps_io_hps_io_uart0_inst_RX     ( HPS_UART_RX    ),     //                               .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     ( HPS_UART_TX    ),     //                               .hps_io_uart0_inst_TX
		
		  .hps_io_hps_io_i2c0_inst_SDA     ( HPS_I2C1_SDAT    ),     //                               .hps_io_i2c0_inst_SDA
        .hps_io_hps_io_i2c0_inst_SCL     ( HPS_I2C1_SCLK    ),     //                               .hps_io_i2c0_inst_SCL
		
		  .hps_io_hps_io_i2c1_inst_SDA     ( HPS_I2C2_SDAT    ),     //                               .hps_io_i2c1_inst_SDA
        .hps_io_hps_io_i2c1_inst_SCL     ( HPS_I2C2_SCLK    ),     //                               .hps_io_i2c1_inst_SCL
        
		  .hps_io_hps_io_gpio_inst_GPIO09  ( HPS_CONV_USB_N),  //                               .hps_io_gpio_inst_GPIO09
        .hps_io_hps_io_gpio_inst_GPIO35  ( HPS_ENET_INT_N),  //                               .hps_io_gpio_inst_GPIO35
        .hps_io_hps_io_gpio_inst_GPIO40  ( HPS_LTC_GPIO),  //                               .hps_io_gpio_inst_GPIO40
        .hps_io_hps_io_gpio_inst_GPIO48  ( HPS_I2C_CONTROL),  //                               .hps_io_gpio_inst_GPIO48
        .hps_io_hps_io_gpio_inst_GPIO53  ( HPS_LED),  //                               .hps_io_gpio_inst_GPIO53
        .hps_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY),  //                               .hps_io_gpio_inst_GPIO54
        .hps_io_hps_io_gpio_inst_GPIO61  ( HPS_GSENSOR_INT),  //                               .hps_io_gpio_inst_GPIO61	  
    );
	 
	 
endmodule
