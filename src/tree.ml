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
type node = |Node of note * note * tree
 and tree = node list
type t = { mutable cantus : note list;
	   mutable contrapunctus : tree }

(** Checks if the note obeys the hormonical rule. *)
let is_harmonique = function
  | 0 | 2 | 4 | 5 | 7 -> true
  |_ -> false

(** Checks if the note obeys the melodical rule. *)
let is_melodic = function
  | 0 | 1 | 2 | 3 | 4 | 5 | 7 -> true
  | _ -> false	   

(** Generates a list of counter notes 
from a previous `c_note` and a current `note`. *)
let get_counter_notes c_note note =
  let rez = ref [] in
  (* exhaustive counter notes *)
  for c = 4 to 11 do
    let h = abs (c - note) in
    let m = abs (c - c_note) in
    if (is_harmonique h) && (is_melodic m) then rez := c :: !rez
  done;
  List.rev !rez (* optional *)

(** Extracts the first element from `node_list` and puts it in `rez`. *)
let cons_hd node_list rez =
  match node_list with
  | [] -> rez
  | h :: [] -> h :: rez
  | _ -> failwith "Wrong list structure in [cons_hd]."

(** To do *)
let new_tree = [Node (0, 0, [])]

(** Eliminates all the paths from `tree` of size inferior to `depth`. *)
let rec clean_tree tree depth =
  match tree with
  | Node (c, n, []) :: rest ->
     if depth > 1 then (clean_tree rest depth)
     else Node(c, n, []) :: (clean_tree rest depth)
  | Node (c, n, sons) :: rest ->
     Node (c, n, (clean_tree sons (depth - 1))) :: (clean_tree rest depth)
  | [] -> []  

(** Builds a `note tree` from a `note_list`. *)
let build_tree note_list =
  let rec loop c_note prev_note note_list =
    match note_list with
    | [] -> []
    | note :: rest ->
       let counter_notes = get_counter_notes c_note note in
       let counter_nodes =
	 List.fold_left
	   (fun rez c ->
	    let nodes = loop c note rest in
	    cons_hd nodes rez) [] counter_notes in
       [Node (c_note, prev_note, List.rev counter_nodes)] in (* List.rev optional *)
  loop 0 0 (note_list @ [0]) (* hack *)

(** To do *)
let traverse_tree tree = []
			   

(** Prints the `tree`, a path on each line. *)
let print_tree tree =
  let rec loop_print tree word = 
    match tree with
    | [] ->  ()
    | Node (c, _, []) :: rest ->
       let new_word = word ^ string_of_int c in
       print_string new_word;
       print_newline ();
       loop_print rest word
    | Node (c, _, sons) :: rest ->
       let new_word = word ^ string_of_int c in
       loop_print sons new_word;
       loop_print rest word
  in loop_print tree ""

let test_tree = [Node (0, 0,
		       [Node (1, 0,
			      [Node (3, 0, []);
			       Node (4, 0, []);
			       Node (5, 0, [])]);
			Node (2, 0, [])])]
