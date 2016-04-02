open Printf

let time f x =
  let t = Sys.time() in
  let fx = f x in
  printf "Execution time: %fs\n" (Sys.time() -. t);
  fx

let test () =

  printf ("\nInput module test functions\n");
  let notes = Read_csv.read_partition "notes.csv" in
  List.iter (printf "%d ") notes;

  printf ("\n\nTree module test functions\n");
  
  printf "\nThe iregular tree\n";
  let w_tree = Tree.test_tree in
  Tree.print_tree w_tree;
  printf "\nAfter cleaning\n";
  Tree.print_tree (Tree.clean_tree w_tree 2);
	     
  printf "\nThe tree for [0; 3; 5]\n";
  let tree = time Tree.build_tree [0; 3; 5] in
  Tree.print_tree tree;
  printf "\nA random counter list for the tree [0; 3; 5]\n";
  List.iter print_int (Tree.traverse_tree tree);
  print_newline();
  
	  
	   
