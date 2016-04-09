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

open MIDI.MIDI

exception Ambitous_wrong of int

type note = Tree.note

let delta_time = 300 
let intensity = 80
let duration  = 4 * delta_time
let division = 600

let midi_from_note note =
  match note with
  | 0 -> 62
  | 1 -> 64
  | 2 -> 65
  | 3 -> 67
  | 4 -> 69
  | 5 -> 71
  | 6 -> 72
  | 7 -> 74
  | 8 -> 76
  | 9 -> 77
  | 10 -> 79
  | 11 -> 81
  | _ -> raise (Ambitous_wrong note)

let create_midi_note rez note =
  let pitch = midi_from_note note in
  let start_note = NoteON (pitch, intensity) in
  let end_note = NoteON (pitch, 0) in
  end_note :: start_note :: rez

let create_midi_track midi_notes channel =
  midi_notes
  |> List.fold_left create_midi_note []
  |> List.map (fun note -> (delta_time, channel, note))
  |> List.rev

let write_original_partition note_list file =
  let note_track = create_midi_track note_list 0 in
  write (division, [note_track]) file
	    
let write_partition note_list counter_note_list file =
  let note_track = create_midi_track note_list 0 in
  let counter_note_track = create_midi_track counter_note_list 1 in
  write (division, [note_track; counter_note_track]) file
