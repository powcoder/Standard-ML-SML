
datatype btree =
                 Empty |
                 Node of int * btree * btree;

 
fun AddNode (i:int, Empty) = Node(i, Empty, Empty) | 
	AddNode(i:int, Node(j, left, right)) = 
		if i = j then Node(i, left, right) 
		else if i < j then Node(j, AddNode(i, left), right)
		else Node(j, left, AddNode(i, right)); 
 
fun printInorder Empty = () | 
	printInorder (Node(i:int,left:btree,right:btree)) =
       		(printInorder left; print(Int.toString i ^ " "); printInorder right);
 
fun printNode Empty = () |
    printNode (Node(i:int, left:btree, right:btree))= print(" my value: " ^ Int.toString i);
	
		
val x : btree = AddNode(50, Empty);
val x : btree = AddNode(75, x);
val x : btree = AddNode(25, x);
val x : btree = AddNode(72, x);
val x : btree = AddNode(20, x);
val x : btree = AddNode(100, x);
val x : btree = AddNode(3, x);
val x : btree = AddNode(36, x); 
val x : btree = AddNode(17, x);
val x : btree = AddNode(87, x);

printInorder(x);