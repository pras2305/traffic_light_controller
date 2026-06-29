module traffic_light_tb;

reg clk;
reg reset;

wire [2:0] roadA;
wire [2:0] roadB;

traffic_light uut(
.clk(clk),
.reset(reset),
.roadA(roadA),
.roadB(roadB)
);

always
#5 clk = ~clk;

initial
begin
   $dumpfile("dump.vcd");
    $dumpvars(0,traffic_light_tb);
clk = 0;
reset = 1;

#10 reset = 0;

#100;

$finish;

end

endmodule
