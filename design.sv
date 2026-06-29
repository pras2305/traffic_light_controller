module traffic_light(
input clk,
input reset,
output reg [2:0] roadA,
output reg [2:0] roadB
);

parameter S0=2'b00,
          S1=2'b01,
          S2=2'b10,
          S3=2'b11;

reg [1:0] state;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
    begin
        case(state)

        S0: state <= S1;

        S1: state <= S2;

        S2: state <= S3;

        S3: state <= S0;

        default: state <= S0;

        endcase
    end
end

always @(*)
begin

case(state)

S0:
begin
roadA = 3'b001;
roadB = 3'b100;
end

S1:
begin
roadA = 3'b010;
roadB = 3'b100;
end

S2:
begin
roadA = 3'b100;
roadB = 3'b001;
end

S3:
begin
roadA = 3'b100;
roadB = 3'b010;
end

default:
begin
roadA = 3'b100;
roadB = 3'b100;
end

endcase

end

endmodule
