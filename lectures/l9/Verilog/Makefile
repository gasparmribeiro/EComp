VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

multi : multi.v
	$(VC) $(CFLAGS) -o multi.out multi.v full_adder.v multi_tb.v
	./multi.out

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