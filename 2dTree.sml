(*   this is a sample of a 2-d binary tree, a tree of trees, each node
has a value 0 to 10, and is part of a standard binary tree using that number. 
In additional each node has its OWN binary tree whose values are in the range
100 to 110. *)

(*  definition of a binary tree node *)
datatype btree =
    Empty |
    Node of int * btree * btree * btree;

(*printInorder will display the contents of the trees from smallest to largest single digit values
and smallest to largest triple digit values in their own sub trees*)

fun printInorder Empty = () | 
	printInorder (Node(i:int, left:btree, mine:btree, right:btree)) =
       		(printInorder left; print(Int.toString i ^ " "); printInorder mine; printInorder right);
 
(* displays level 0 for single digit values and level 1 for triple digit values *)

fun printLevel (Empty, level:int) = () |
	printLevel (Node(i,  left, Empty, right), level:int) = 
		(printLevel (left, level); print("Depth " ^ Int.toString level ^ ": " ^ Int.toString i ^ " "); printLevel (right, level)) | 
	printLevel(Node(i,  left,root, right), level:int) = 
		let 
			val w = level
		in
			(printLevel(left, w); print("Depth " ^ Int.toString w ^ ": " ^ Int.toString i ^ "\n" ); printLevel (root, w+1) ; print("\n"); printLevel(right, w))
		end;
		
 
    (* addNode creates the first node with the single digit value in it, 
then addNode2 creates the node (100 - 110 value node inside it *)
    
fun AddNode2(j:int, Empty ) =  Node(j, Empty, Empty, Empty) |
    AddNode2( j:int, Node(compare, left, root, right)) =
        if j = compare then Node(compare, left, root, right)
	else if j < compare then Node(compare, AddNode2( j,left), root,  right)
	else Node(compare, left, root, AddNode2( j, right));
        
fun AddNode(i:int, j:int, Empty ) =  Node(i, Empty, AddNode2(j, Empty), Empty) |
    AddNode(i:int, j:int, Node(compare, left, root, right)) =
        if i = compare then Node(compare, left, AddNode2(j, root), right)
	else if i < compare then Node(compare, AddNode(i, j, left), root, right)
	else Node(compare, left, root,  AddNode(i, j, right));
        
     (* sort and sort2, actually search for particular node (0-10, 100-110) value *)
fun sort2(j:int, Empty) = print("Not found!") |
    sort2(j:int, Node(compare,  left, root, right)) =
        if j = compare then (print(Int.toString j ^ "->")) 
        else if j < compare then sort2( j, left)
        else sort2( j, right);
		
 
		
fun sort(i:int, j:int,  Empty) = print("Not found!") |
    sort(i:int, j:int,  Node(compare, left, root, right)) =
        if i = compare then (print(Int.toString i ^ "->"); sort2(j, root))
        else if i < compare then sort(i, j, left)
        else sort(i, j, right);
 
 
	(* like time(NULL) in c++ *)	
val seed = 
let
  val m=Date.minute(Date.fromTimeLocal(Time.now()))
  val s=Date.second(Date.fromTimeLocal(Time.now()))
  in 
	Random.rand(m,s)
end;

(* this just gets a random int between 0 and n *)
fun getRandInt(n)=Random.randRange(0,n) seed;
	 
(* a recursivly adds nNodes via  addNode with random values *) 
fun PopulateTree(xTree, nNodes:int) =
	
		let
			val q = nNodes - 1
			val x2Tree = xTree
		in
			if nNodes > 0 then 
				PopulateTree(AddNode(getRandInt 10, 100+getRandInt 10, x2Tree), q)
			else AddNode(getRandInt 10,100+ getRandInt 10,  xTree)
		end;
 (* create a random node *)
val x : btree = AddNode(getRandInt 10, 100+getRandInt 10, Empty);
 (* populates the tree based on the root x above *)
val x : btree = PopulateTree(x,10);


printLevel(x, 0); 