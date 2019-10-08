VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

adder : adder.v
	$(VC) $(CFLAGS) -o adder.out adder.v adder_tb.v
	./adder.out

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