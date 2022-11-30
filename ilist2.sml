type iList = int * int list;
type mList = iList list;

fun idpart(a:iList) = #1a;
fun Lpart(a:iList) = #2a;
fun incId(a:iList) = (#1a +1, #2a );
fun appL(b:int, a:iList) =(#1a,  (#2a)@[b] );

fun appM(a:mList, b:iList)= [b]@a;
fun subone(a) = a-1;
fun populate(  b:int, c:iList) =  if(b>0) 
	then 
		let
			val c  = (b, [10*b]);
		in  [c]@populate(subone(b), c) end
	 
else [];

val x:iList = (1000, [2,3,4]);
idpart(x);
Lpart(x);
val x = incId(x);
val x = appL(5,x);
val x = appL(6,x);

val z:mList = appM([],x);
val x = (2000,[20,30]);
val x = incId(x);
val x = appL(40,x);
val z = appM(z,x); 

val y = populate ( 5, x );
 









