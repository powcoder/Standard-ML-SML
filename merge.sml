
fun halve nil = (nil, nil) |
halve [a] = ([a], nil) |
halve (a::b::cs) = 
    let 
       val (x,y) =halve cs
    in 
        (a::x,b::y)
    end;

fun merge (nil, ys) = ys |
merge (xs, nil) = xs |
merge( x::xs, y::ys) = 
    if(x<y) then x::merge (xs, y::ys)
    else y::merge(x::xs, ys);

fun  mergeSort nil = nil |
mergeSort [a] = [a] |
mergeSort theList = 
   let
	val(x,y) = halve theList
   in 
	merge(mergeSort x, mergeSort y)
end;