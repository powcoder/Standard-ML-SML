type iList = int * int list;
type mList = iList list;

fun fpart(a:iList) = #1a;
fun spart(a:iList) = #2a;
fun incId(a:iList) = (#1a +1, #2a );

fun appL(b:int, a:iList) =(#1a,  (#2a)@[b] );
fun appM(a:mList, b:iList)= [b]@a;

fun subone(a) = a-1;
fun addone(a) = a+1;
fun Lsubone(a:int list) = if ( a=[]) then []
						  else [subone(hd(a))]@Lsubone(tl(a));
						  
fun populate(  b:int, d:int) =  if(b>0) 
	then 
		let	 
			val c:iList  = (b, [10*b]);
			val c  = appL(10*b+d, c);
		in  [c]@populate(subone(b), addone(d))end
else [];


fun findval(i:int, a:mList) =
	if(i= fpart(hd(a))) then 	 
							(print ("FOUND " ^ Int.toString i^"\n"); 
							let 
								val j = Lsubone(spart(hd(a)))
							
							in hd(a)=(i,j)
						
							end)
						
	else 
		 findval(i, tl(a));
	
	
val n = [1,2,3];
val m = Lsubone(n);
 
val y = populate (5, 2);
val x = findval(3,y);



 









