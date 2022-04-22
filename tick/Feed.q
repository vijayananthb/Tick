h:neg hopen `:localhost:5000
srcs:`LP1`LP2`LP3`LP4`LP5
syms:`APPL`GOOG`CAT`NYSE!(100;200;250.;50.)
n:2
side:`buy`sell
m:{y+0.01*sums x?-6+til 13}
b:{x-0.01*count[x]?0 1 2 3 4 5 6}
a:{x+0.01*count[x]?0 1 2 3 4 5 6}
s:{x?50 100 200 300.}
flag:1


.z.ts:{
  I:raze m[n;] each value syms;N::n*count syms;k:raze (n#) each key syms;
  $[0<flag mod 10;
    h(".u.upd";`quote;(asc N?.z.N;k;N?srcs;b I;a I;s N;s N));
    $[0<flag mod 100;
      h(".u.upd";`trade;(asc N?.z.N;k;N?srcs;b I;s N;N?side));
      h(".u.upd";`positions;(asc N?.z.N;k;N?srcs;b I;s N;N?side;N?10?100i;N?100))]];
  flag+:1; }
\t 100
