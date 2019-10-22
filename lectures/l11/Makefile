VC = iverilog
CFLAGS = -W all -g2005-sv -D DEBUG

add_shft_mul : add_shft_mul.v
	$(VC) $(CFLAGS) -o add_shft_mul.out add_shft_mul.v
	./add_shft_mul.out

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