VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

rom : rom.v
	$(VC) $(CFLAGS) -o rom.out rom.v
	./rom.out

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