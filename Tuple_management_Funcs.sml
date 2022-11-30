type irpair = int * real;

val x:irpair = (3, 0.35);

fun incir (y:irpair) = #1y;

type node = int * char *int;

val seed=let
  val m=Date.minute(Date.fromTimeLocal(Time.now()))
  val s=Date.second(Date.fromTimeLocal(Time.now()))
  in Random.rand(m,s)
end;

Control.Print.printLength:=50;

fun getRandInt(n)=Random.randRange(0,n) seed;

fun getRandAlpha(a)=chr(65+getRandInt(a));

fun makeNodeList(n)=if n=0 then []
    else (getRandInt(9),getRandAlpha(25),1)::makeNodeList(n-1);


fun incChar (c : char, (x : (int * char * int) list)) =  
		if null x then (1,c,1)::x
		else
			if #2 (List.hd(x) ) = c then 
			(#1(List.hd(x)), #2(List.hd(x) ), #3(List.hd(x) ) +1 )::List.tl(x)
			else List.hd(x)::incChar(c,tl(x));
						 
										 
										 
fun addint (i:int, x:int list) = i::x;	
 						 
										 
										 
										 
										 
										 