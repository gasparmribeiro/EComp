module cla
	(
		input  [3:0] 	a,
		input  [3:0] 	b,
	 	input			c_in,
	 	output  		c_out,
	    output [3:0]  	s
   );

	wire [4:0] c;
	assign c[0] = c_in;

	wire [3:0] p, g;

	wire [2:0] p_kl, g_kl;

	A a0(
		.a(a[0]),
		.b(b[0]),
		.c_in(c[0]),
		.p(p[0]),
		.g(g[0]),
		.s(s[0])
		);


	A a1(
		.a(a[1]),
		.b(b[1]),
		.c_in(c[1]),
		.p(p[1]),
		.g(g[1]),
		.s(s[1])
		);

	A a2(
		.a(a[2]),
		.b(b[2]),
		.c_in(c[2]),
		.p(p[2]),
		.g(g[2]),
		.s(s[2])
		);

	A a3(
		.a(a[3]),
		.b(b[3]),
		.c_in(c[3]),
		.p(p[3]),
		.g(g[3]),
		.s(s[3])
		);

	B b0(
		.p_l(p[0]),
		.g_l(g[0]),
	 	.p_k(p[1]),
	 	.g_k(g[1]),
	 	.c_in(c[0]),
	 	.c_out(c[1]),
	 	.p_kl(p_kl[0]),
	    .g_kl(g_kl[0])
	);


	B b1(
		.p_l(p[2]),
		.g_l(g[2]),
	 	.p_k(p[3]),
	 	.g_k(g[3]),
	 	.c_in(c[2]),
	 	.c_out(c[3]),
	 	.p_kl(p_kl[1]),
	    .g_kl(g_kl[1])
	);

	//bloco C - falta uma operaçao
	B c0(
		.p_l(p_kl[0]),
		.g_l(g_kl[0]),
	 	.p_k(p_kl[1]),
	 	.g_k(g_kl[1]),
	 	.c_in(c[0]),
	 	.c_out(c[2]),
	 	.p_kl(p_kl[2]),
	    .g_kl(g_kl[2])
	);

	assign c[4] = g_kl[2] + (p_kl[2] & c[0]);


	assign c_out = c[4];


endmodule

