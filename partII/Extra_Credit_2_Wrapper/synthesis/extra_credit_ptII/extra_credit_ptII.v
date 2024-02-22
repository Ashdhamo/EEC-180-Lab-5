
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module extra_credit_ptII(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW
);

// 1. You may have to modify the signal names to match your design
// 2. You need to add your hexadecimal 7-segment decoder from prior labs
// 		- Hex instantiations below may need to be modified

//=======================================================
//  REG/WIRE declarations
//=======================================================


//=======================================================
//  Structural coding
//=======================================================

wire [15:0]
	product   /* synthesis keep */;

// These signal names must be kept the same!
wire [7:0]
	mplicand,  /* synthesis keep */
	mplier     /* synthesis keep */;

wire
	start      /*synthesis keep*/,
	done 	   /*synthesis keep*/;

assign LEDR[0] = done;

// Modify the instance and port names accordingly
booth i0
(	
	.clk(MAX10_CLK1_50), 
	.Resetn(SW[0]), 
	.Start(start), 
	.Mplier(mplier), 
	.Mcand(mplicand), 
	.Finish(done),
	.FProduct({product})
);

// Modify the instance and port names accordingly
seg7hex i1
(
	.in(product[3:0]),
	.out(HEX0)
);	

seg7hex i2
(
	.in(product[7:4]),
	.out(HEX1)
);

seg7hex i3
(
	.in(product[11:8]),
	.out(HEX2)
);

seg7hex i4
(
	.in(product[15:12]),
	.out(HEX3)
);

//=======================================================
//  Do not touch the ISSP instance below
//=======================================================
issp_booth issp0 
(
	.source ({start, mplier, mplicand}),
	.source_clk (MAX10_CLK1_50)
);

endmodule