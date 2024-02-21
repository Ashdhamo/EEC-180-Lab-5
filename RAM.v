module ram_1port(

  input [(4-1):0] data,
  input [(4-1):0] addr,
  input we, clock,
  //input [9:0]		SW,
  output reg [(4-1):0] q
);
parameter DATA_WIDTH = 4; parameter
ADDR_WIDTH = 4;
// Declare the RAM variable
//reg [(4-1):0] ram1[(2**4)-1:0];
//reg [(4-1):0] ram0[(2**4)-1:0];
/* synthesis ramstyle = "M9K" */
  reg [3:0] mem [15:0];//also found 127

    always @(posedge clock) 
	 begin
      if (we) begin
			mem[addr] <= data;
          //mem[address] <= data_in; // write
		end	 
			q <= mem[addr];
      //data_out <= mem[address]; // read
	 end


endmodule	 
