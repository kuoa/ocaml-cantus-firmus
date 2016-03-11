(*********************************************************
 * OCaml tralala project description                     *
 *********************************************************
 * Module: Tree                                          *
 * -------                                               *
 * A tree structure                                      * 
 * representing the main melodic structure               *
 * toghether with all the possible counterpoints.        * 
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)

type note = int
type node = Node of note * note * tree
 and tree = node list

type t

val new_tree : tree
val build_tree : note list -> tree
val traverse_tree : tree -> note list       
