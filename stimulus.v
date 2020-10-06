module stimulus;
  
reg clk,reset;
reg [7:0] coin;
reg [2:0] drink_choose;


FSM fsm(coin, drink_choose, clk, reset);

initial clk = 1'b0;
always #5 clk = ~clk;


initial
begin

// design your test case here

#10 coin = 8'd10;		//coin 10,	total 10 dollars	tea
#10 coin = 8'd5 ;		//coin 5,	total 15 dollars	tea | coke
#10 coin = 8'd1 ;		//coin 1,	total 16 dollars	tea | coke
#10 coin = 8'd10 ;		//coin 10,	total 26 dollars	tea | coke | coffee | milk

#10 coin = 8'd0 ;
#10 drink_choose = 2'd3 ; //3=coffee	coffee out
#10 drink_choose = 2'd0 ;
			//exchange 6 dollars


end



endmodule