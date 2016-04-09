open Cantus.Firmus
open Printf
    
let () =

  let track_original = Sys.argv.(1)  in                           (* original track name *)
  let track_output = "input_" ^ track_original in                 (* my-original track name *)
  let track_cantus_output = "output_" ^ track_original in         (* my-original-output name *)
  
  let note_list = read_partition track_original in
  let counter_note_tree = build_tree note_list in  
  let counter_note_list = traverse_tree counter_note_tree in
  printf "\nOriginal song notes : \n";
  print_notes note_list;

  printf "\nCounter song notes : \n";
  print_notes counter_note_list;		

  printf ("\n\nChanging rithm and writing [%s] to [%s]\n") track_original track_output;
  Write_midi.write_original_partition note_list track_output;
  printf "...Done\n";
  printf ("\nConstructing cantus-firmus and writing to [%s]\n") track_output;
  write_partition note_list counter_note_list track_cantus_output;
  printf "...Done\n";

  printf ("\nYou may now listen to [%s] and then compare with [%s]\n\n") track_output track_cantus_output
  
