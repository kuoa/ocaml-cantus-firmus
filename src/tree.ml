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

(*
(** exhaustive list of counter notes *)
let counter_notes = [4; 5; 6; 7; 8; 9; 10; 11]

(** exhaustive list of harmonique notes difference *)
let harmonique__notes = [0; 2; 4; 5; 7]

(** exhaustive list of melodic notes difference *)
let melodic_notes = [0; 1; 2; 3; 4; 5; 7]

(** checks if a note is present in a note list 
[ (!) : since the lists are sorted, this function can be improved
         but the result is instant for 100000 notes, this is good enough for now.] *)
let is_present note note_list =
  List.exists (fun n -> note = n) note_list

(** generates a list of counter notes from a note and a previous counter note *)
let get_counter_notes c_note note =
  counter_notes
  |> List.filter (fun c -> is_present (abs (c - note)) harmonique__notes)
  |> List.filter (fun c -> is_present (abs (c - c_note)) melodic_notes)

 *)
	   
let get_counter_notes c_note note =
  let rez = ref [] in
  for c = 4 to 11 do
    let h = abs (c - note) in
    let m = abs (c - c_note) in
    if (h = 0 || h = 2 || h = 4 || h = 5 || h = 7) &&
	 (m >= 0 && m <= 5 || m = 7) then rez := c :: !rez
  done;
  List.rev !rez
    
  
(** extracts the nodes *)
let extract_nodes node_list_list =
  let rec loop node_list_list rez =
    match node_list_list with
    | [] -> List.rev rez
    | node_list :: rest ->
      match node_list with
       |node :: _ -> loop rest (node :: rez)
       |_ -> loop rest rez
  in loop node_list_list []

let build_tree note_list =
  let rec loop c_note prev_note note_list =
    match note_list with
    | [] -> []
    | note :: rest ->
       let counter_notes = get_counter_notes c_note note in
       let counter_nodes = List.map (fun c -> (loop c note rest)) counter_notes in
       let extracted_nodes = extract_nodes counter_nodes in
       [Node (c_note, prev_note, extracted_nodes)] in
  loop 0 0 (note_list @ [0])
