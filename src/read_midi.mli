(*********************************************************
 * ocaml-cantus-firmus project description               *
 *********************************************************
 * Module: Read_midi                                     *
 * -------                                               *
 * Reads a midi file                                     *
 * and transforms it using a note structure              *
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)

exception Non_valid_file		

type note = Tree.note

val read_partition : string -> note list
