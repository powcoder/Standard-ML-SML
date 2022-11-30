(* this defines a 3-tuple type*)
type irpair = int * real * bool;

(* access functions for the 3-tuple*)
fun ipart (y:irpair) = #1 y;
fun rpart (y:irpair) = #2 y;
fun bpart(y:irpair) = #3 y;

(* a composite type of another char and a irpair*)
type ctriple = char * irpair;

(* access functions for the ctriple function *)
fun cpart (y:ctriple) = #1 y;
fun irpart(y:ctriple) = #2 y;
fun itriple(y:ctriple) = #1(#2 y);
fun rtriple(y:ctriple) = #2(#2 y);
fun btriple(y:ctriple) = #3(#2 y);

fun modipart(i:int, y:irpair) =
		   (i + ipart(y),rpart(y), bpart(y));

fun modrpart(r:real, y:irpair) =
		   (ipart(y),r+rpart(y), bpart(y));

fun modbpart(b:bool, y:irpair) = (ipart(y), rpart(y), b);

fun modtriple(c:char, i:int, r:real, b:bool, t:ctriple)	=  
	(c, (ipart(modipart(i,irpart(t))),(rpart(modrpart(r, irpart(t)))), bpart(modbpart(b,irpart(t)))));
		
val x:irpair = (3, 0.35, false);
val w:ctriple = (#"A", x);












