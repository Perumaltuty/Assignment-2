module sipomod(clk,clear, si, po);

input clk, si,clear;

  output [7:0] po;

  reg [7:0] tmp;

  reg [7:0] po;

always @(posedge clk)

begin

if (clear)

tmp <= 4’b00000000;

else

tmp <= tmp << 1;

tmp[0] <= si;

po = tmp;

end

endmodule
