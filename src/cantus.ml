(*********************************************************
 * ocaml-cantus-firmus project description               *
 *********************************************************
 * Module: Cantus                                        *
 * -------                                               *
 * A functor that manipulates a partition and the        *
 * associated tree                                       *
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)

module type INPUT =
  sig    
    exception Non_valid_file		

    type note = Tree.note	       

    val read_partition : string -> note list					
  end

module type OUTPUT =
  sig    
    type note = Tree.note

    val write_partition : note list -> note list -> string -> unit
  end

module type TREE =
  sig    
    type note = Tree.note
    type tree = Tree.tree		  

    val build_tree : note list -> tree
    val traverse_tree : tree -> note list
  end


module Functor =
  functor (I : INPUT) (W : OUTPUT) (T : TREE) ->
  struct
    type note = T.note
    type tree = T.tree

    let read_partition file = I.read_partition file

    let write_partition note_list counter_note_list file =
      W.write_partition note_list counter_note_list file

    let build_tree note_list = T.build_tree note_list

    let traverse_tree tree = T.traverse_tree tree

    let print_notes =  List.iter (Printf.printf "%d ")
  end

module Firmus = Functor (Read_midi) (Write_midi) (Tree)

    
