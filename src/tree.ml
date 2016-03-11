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

 let test = [Node (0,0, 
		  [Node (1, 0,
			 [Node (3, 0, []);
			  Node (4, 0, []);
			  Node (5, 0, [])]);
		   Node (2, 0, []);
		  ])
	  ];;

