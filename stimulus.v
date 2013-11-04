module t_mealy_project;
  reg t_y_out;
  reg t_x_in, t_clock, t_reset;
  
  mealy_project M0(t_y_out,t_x_in, t_clock, t_reset);
  reg a=1'b0;
  reg b=1'b1;
  initial #200 $finish;
  initial
  begin
    #15 t_clock=1'b0;
    forever #5 t_clock=~t_clock;
    begin
      t_y_out=a;
      #5 t_y_out=b;
      #10 t_y_out=a;
    end
  end
  initial
    fork
    t_reset=0;
    #2 t_reset=1;
    #87 t_reset=0;
    #89 t_reset=1;
    #10 t_x_in=1;    
    #30 t_x_in=0;
    #40 t_x_in=1;
    #50 t_x_in=0;
    #52 t_x_in=1;
    #54 t_x_in=0;
    #70 t_x_in=1;
    join
endmodule
      
