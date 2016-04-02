module type INPUT =
  sig
    type note = Input.note
	   
    exception Non_valid_file		

    val read_csv : string -> note list
  end

module type TREE =
  sig
    
    type note = Tree.note
    type tree = Tree.tree
    type t

    val build_tree : note list -> tree
    val traverse_tree : tree -> note list
  end

module Functor =
  functor (I : INPUT) (T : TREE) ->
  struct

    type note = I.note
    type tree = T.t
    type t

    let read_partition file = I.read_csv file
    let build_tree note_list = T.build_tree note_list
    let traverse_tree tree = T.traverse_tree tree

  end

module Firmus = Functor (Input) (Tree)

    
