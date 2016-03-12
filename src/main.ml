open Tree

let time f x =
  let t = Sys.time() in
  let fx = f x in
  Printf.printf "Execution time: %fs\n" (Sys.time() -. t)
;;
    
let () = time build_tree [0; 3; 7; 10; 10];;
