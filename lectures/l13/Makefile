VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

div : div.v
	$(VC) $(CFLAGS) -o div.out div.v
	./div.out

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