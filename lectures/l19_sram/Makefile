VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

sense_amp : sense_amp.v
	$(VC) $(CFLAGS) -o sense_amp.out sense_amp.v
	./sense_amp.out

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