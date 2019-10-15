VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

cla : cla.v
	$(VC) $(CFLAGS) -o cla.out cla.v A.v B.v cla_tb.v
	./cla.out

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