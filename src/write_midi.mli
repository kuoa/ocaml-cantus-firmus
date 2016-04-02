(*********************************************************
 * ocaml-cantus-firmus project description               *
 *********************************************************
 * Module: Write_midi                                    *
 * -------                                               *
 * Writes a midi file                                    *
 * from a note structer and a note tree                  *
 * -------                                               *
 * https://github.com/kuoa/ocaml-cantus-firmus           *
 *********************************************************)



type note = Tree.note

val write_original_partition : note list -> string -> unit
val write_partition : note list -> note list -> string -> unit
