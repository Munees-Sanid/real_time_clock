// real time stop watch clock
module clock(
	input clk,rst,
	output reg [4:0]hrs,
	output reg [5:0]mins,
	output reg [5:0]sec);
always @(posedge clk or posedge rst) begin
if(~rst)begin
	hrs<=0;
	mins<=0;
	sec<=0;
end 

else begin 

if(sec==59)begin

sec<=0;  // sec=0

if(mins==59)begin

mins<=0;  // minute =0

if(hrs==23)

hrs<=0;  // hours=0

else

hrs<=hrs+1;

end 

else begin

mins<=mins+1;

end 

end else begin

sec<=sec+1; 

end

end
end
endmodule 


// test bench 

module tb;

reg clk;
reg rst;
wire [4:0]hrs;
wire [5:0]mins;
wire [5:0]sec;

clock dut (.*);

always #1 clk =~clk;

initial begin 
$monitor ("  hours  = %d   ::    minute  = %d   ::    second =%d ",hrs,mins,sec);
clk=1'b0;
rst =0;
#20 rst =1;
#172800 rst=0;
#120 $finish;
end

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,tb);

end
endmodule

