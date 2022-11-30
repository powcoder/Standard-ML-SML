

val seed=let
  val m=Date.minute(Date.fromTimeLocal(Time.now()))
  val s=Date.second(Date.fromTimeLocal(Time.now()))
  in Random.rand(m,s)
end;

Control.Print.printLength:=50;

fun getRandInt(n)=Random.randRange(0,n) seed;

fun getRandAlpha(a)=chr(65+getRandInt(a));

fun makeNodeList(n)=if n=0 then []
else (getRandInt(9),getRandAlpha(25),n)::makeNodeList(n-1);

