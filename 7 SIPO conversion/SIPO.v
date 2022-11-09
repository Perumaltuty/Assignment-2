module sipo(ser_in,clk,reset,en_sipo,par_out_sipo);
input ser_in,clk,reset,en_sipo;
output reg[7:0]par_out_sipo;
initial par_out_sipo=8'b0;
always@(negedge clk or posedge reset)
begin
if(reset)
par_out_sipo<=8'b0;
else if(en_sipo)
par_out_sipo<={ser_in,par_out_sipo[7:1]};
end
endmodule
