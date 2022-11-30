fun subone(a) = a-1;

fun plusone(a) = a + 1;

(* comments work like this *)


fun blastoff(a) =  if(a>0) then [a]@blastoff(subone(a))
else [];
 
fun countup(start:int, quit:int) = if(start > quit) then []
else [start]@countup(plusone(start), quit);

