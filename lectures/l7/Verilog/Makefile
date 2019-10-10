VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

n_full_adder : n_full_adder.v
	$(VC) $(CFLAGS) -o full_adder.out n_full_adder.v full_adder.v full_adder_tb.v
	./full_adder.out

clean: 	
	@rm -f *#
	@rm -f *~ 
	@rm -f *.vcd
	@rm -f *.hex
	@rm -f xtop
	@rm -f *.out
	@rm -f xdict
	@rm -f xdict.json	

.phony: all clean