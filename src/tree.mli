(*********************************************************
 * ocaml-cantus-firmus project description               *
 *********************************************************
 * Module: Tree                                          *
 * -------                                               *
 * A tree structure                                      * 
 * representing the main melodic structure               *
 * toghether with all the possible counterpoints.        * 
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)

type note = Read_csv.note
type tree

val new_tree : tree		
val build_tree : note list -> tree
val traverse_tree : tree -> note list
val print_tree : tree -> unit

val test_tree : tree
val clean_tree : tree -> int -> tree

