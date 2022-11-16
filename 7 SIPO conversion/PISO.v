module PISO(D,Q,clk,rst,SL);
  input [7:0]D;
  input rst,clk,SL;                                 
  output [7:0]Q;
  wire[7:0]x,y,z;                   
  dff s1(D[0],clk,rst,Q[0]);
genvar i;
generate
  for(i=1;i<8;i=i+1)begin
    and(x[i],Q[i-1],SL);
    and(y[i],~SL,D[i]);
    or(z[i],x[i],y[i]);
    dff s0(z[i],clk,rst,Q[i]);    end
  endgenerate
endmodule
module dff(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  always@(negedge clk)
  begin
    if(rst == 1)
      begin
        q=0;
      end
    else
      begin
        q=d;
      end
  end
endmodule
