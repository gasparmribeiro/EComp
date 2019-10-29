VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

booth_mul : booth_mul.v
	$(VC) $(CFLAGS) -o booth_mul.out booth_mul.v
	./booth_mul.out

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