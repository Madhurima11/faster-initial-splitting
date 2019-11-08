load "prime-and-degrees.m";
Fp<y1>:=PolynomialRing(GF(p));
load "h-poly.m";
Fp_n1<y>:=ext< GF(p)| hy >;
polyring_Fp_n1<x> := PolynomialRing(Fp_n1);
load "I-poly.m";
Fp_n1_n2<x1>:=ext<Fp_n1| Ix >;


//printf "\n p=%o, n1=%o, n2=%o, B1=%o, d=%o, s_value=%o \n",p,n1,n2,B1,d,s_value;




