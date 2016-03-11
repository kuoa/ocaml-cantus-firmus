
let () =
  let l = Input.read_csv "notes.csv" in
  List.iter (Printf.printf "%d;") l
;;
