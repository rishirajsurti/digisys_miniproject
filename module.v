//mealy FSM miniproject
module mealy_project(
  output reg y_out=3'b010,
  input x_in,clock,reset
  );
  reg[2:0] state, next_state;
  parameter s0=3'b000; parameter s1=3'b001; parameter s2=3'b010; parameter s3=3'b011; parameter s4=3'b100; parameter s5=3'b101; parameter s6=3'b110; parameter s7=3'b111;
  always @(posedge clock, negedge reset)
    if(reset==0) state<=s2;
    else state<=next_state;
   
  always @(state,x_in)
    case(state)
      s0: if(x_in) next_state<=s1; else next_state <= s0;
      s1: if(x_in) next_state<=s3; else next_state <= s2;
      s2: if(x_in) next_state<=s5; else next_state <= s4; 
      s3: if(x_in) next_state<=s7; else next_state <= s6; 
      s4: if(x_in) next_state<=s1; else next_state <= s0; 
      s5: if(x_in) next_state<=s3; else next_state <= s2; 
      s6: if(x_in) next_state<=s5; else next_state <= s4; 
      s7: if(x_in) next_state<=s7; else next_state <= s6; 
    endcase
    
  always @(state,x_in)
    case(state)
      s0: y_out<=0;
      s1: y_out<=0;
      s2: y_out<=0;
      s3: y_out<=0;      
      s4: y_out<=1;
      s5: y_out<=1;
      s6: y_out<=1;
      s7: y_out<=1;
    endcase
endmodule

