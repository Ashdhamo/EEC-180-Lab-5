module RAM (
  input [3:0] data,
  input [3:0] addr,
  input we, clock,
  output reg [3:0] q
);

// Declare the RAM variable
reg [3:0] ram1[7:0];
reg [3:0] ram0[7:0];

/* synthesis ramstyle = "M9K" */
reg [3:0] mem [182:0];//also found 127

  always @(posedge clock) begin
      if (we) begin
			  RAM[addr] = data;
        //mem[address] <= data_in; // write
		  end	 
			q <= RAM[addr];
      //data_out <= mem[address]; // read
	end
	 

endmodule	 
