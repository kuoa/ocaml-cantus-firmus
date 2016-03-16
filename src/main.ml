open Tree
open Printf

let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "Execution time: %fs\n" (Sys.time() -. t);
  fx
;;
    
let () =
  printf "\nThe tree for [0; 3; 5]\n";
  let tree = time build_tree [0; 3; 5] in
  print_tree tree;

  printf "\nThe iregular tree\n";
  let w_tree = test_tree in
  print_tree w_tree;
  printf "\nAfter cleaning\n";
  print_tree (clean_tree w_tree 3)
;;      
