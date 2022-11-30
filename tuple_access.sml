type irpair = int * real;
fun ipart (y:irpair) = #1 y;
fun rpart (y:irpair) = #2 y;

type ctriple = char * irpair;
fun cpart (y:ctriple) = #1 y;
fun irpart(y:ctriple) = #2 y;
fun itriple(y:ctriple) = #1(#2 y);
fun rtriple(y:ctriple) = #2(#2 y);

fun modipart(i:int, y:irpair) =
		   (i + ipart(y),rpart(y));
fun modrpart(r:real, y:irpair) =
		   (ipart(y),r+rpart(y));

fun modtriple(c:char, i:int, r:real, t:ctriple)	=  
		(c, (ipart(modipart(i,irpart(t))),(rpart(modrpart(r, irpart(t))))));
		
val x:irpair = (3, 0.35);
val w:ctriple = (#"A", x);












