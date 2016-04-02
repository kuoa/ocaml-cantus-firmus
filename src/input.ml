(*********************************************************
 * ocaml-cantus-firmus project description               *
 *********************************************************
 * Module: Input                                         *
 * -------                                               *
 * Parse .csv file and generate a note list.             *
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)

type note = int
	      
exception Non_valid_file
	    
let read_csv file =
  let comma_regex = Str.regexp "," in
  let note_list = ref [] in
  let ic = open_in file in
  
  try
    while true do
      let line = input_line ic in
      let string_list = Str.split comma_regex line in
      let int_list = List.map int_of_string string_list in
      note_list := !note_list @ int_list;
    done;
    !note_list

  with
  | End_of_file -> close_in ic; !note_list
  | _ -> close_in ic; raise Non_valid_file

	 
  
 
