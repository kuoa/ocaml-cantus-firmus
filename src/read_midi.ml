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

open MIDI.MIDI

type note = Tree.note
type t = midievent

exception Ambitous_wrong of note
exception Multiple_tracks
exception Non_valid_file

let note_from_midi midi_note =
  match midi_note with
  | 62 -> 0
  | 64 -> 1
  | 65 -> 2
  | 67 -> 3
  | 69 -> 4
  | 71 -> 5
  | 72 -> 6
  | 74 -> 7
  | 76 -> 8
  | 77 -> 9
  | 79 -> 10
  | 81 -> 11
  | _ -> raise (Ambitous_wrong midi_note)

let map_midi_event midi_event rez =
  match midi_event with
  | NoteON (pitch, intensity) ->
     if intensity = 0 then rez else (note_from_midi pitch) :: rez
  | _ -> rez
	    

let read_partition file =
  let (division, track_list) = read file in
  match track_list with
  | one_track :: [] ->
     List.fold_left (fun rez (dt, chn, note) -> map_midi_event note rez) [] one_track
  | first_track :: rest -> raise Multiple_tracks
  | [] -> raise Non_valid_file
  
