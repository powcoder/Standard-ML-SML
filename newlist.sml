
datatype TwoParts = Empty | node of int*int;

fun addTwoParts(i:int, j:int, x:(int*int) list) = (i,j)::x;

fun findTwoParts(target:int, x:(int*int) list) =
	if #2(list.hd(x)) = target then list.hd(x)
	else findTwoParts(target,list.tl(x));
	
val L = addTwoP(3,6,[]);
val L = addTwoP(4,7,L);
val L = addTwoP(5,8,L);
val L = addTwoP(6,9,L);

