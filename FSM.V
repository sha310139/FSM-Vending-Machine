
`define TRUE 1'b1
`define FALSE 1'b0

// drink choose number


module FSM(coin, choose, clk, reset);


reg [7:0] total;
input clk, reset;
input [7:0] coin;
input [2:0] choose;

parameter TEA = 3'd1,
	  COKE = 3'd2,
	  COFFEE = 3'd3,
	  MILK = 3'd4;

parameter S0 = 2'b00,
	  S1 = 2'b01,
	  S2 = 2'b10,
	  S3 = 2'b11;


reg [1:0] state;
reg [1:0] next_state;

initial
begin
total = 0;
#5
state <= S0;
end


always @(clk)
begin
	state <= next_state;
end

always @(coin)
begin
total = total + coin;
end


always @(state)
begin
case(state)
	S0: begin
		if(coin > 8'd0)
		begin
			$display("coin %d,\t total %d dollars", coin, total);
		end
	    end
	S1: begin
		if(coin == 0) ;
		else if(total >= 8'd25)
			$display("tea | coke | coffee | milk");
		else if(total >= 8'd20)
			$display("tea | coke | coffee");
		else if(total >= 8'd15)
			$display("tea | coke");
		else if(total >= 8'd10)
			$display("tea");
	    end
	S2: begin
		if(choose == TEA)
		begin
			$display("tea out");
			total = total - 8'd10;
		end
		else if(choose == COKE)
		begin
			$display("coke out");
			total = total - 8'd15;
		end
			
		else if(choose == COFFEE)
		begin
			$display("coffee out");
			total = total - 8'd20;
		end
		else if(choose == MILK)
		begin
			$display("milk out");
			total = total - 8'd25;
		end
	    end
	S3: begin
		$display("exchange %d dollars", total);
		total = 0;
	    end
endcase
end


always @(state or coin or choose)
begin
	case (state)
		S0: begin
		    if(total >= 8'd10)	// ??????
			next_state = S1;
		    else
			next_state = S0;
		    end

		S1: begin
		    if(choose == TEA || choose == COKE || choose == COFFEE || choose == MILK)
			next_state = S2;
		    else if (coin == 0)
			next_state = S1;
		    else
			next_state = S0;
		    end

		S2: begin
		    if(choose == TEA || choose == COKE || choose == COFFEE || choose == MILK)
			next_state = S3;
		    else
			next_state = S2;
		    end
		S3: next_state = S0;

		default: next_state = S0;
	endcase
end

endmodule





