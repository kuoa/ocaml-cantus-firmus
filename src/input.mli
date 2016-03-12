(*********************************************************
 * OCaml tralala project description                     *
 *********************************************************
 * Module: Input                                         *
 * -------                                               *
 * Parse .csv file and generate a note list.             *
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)

type note = int
	   
exception Non_valid_file		

val read_csv : string -> note list
