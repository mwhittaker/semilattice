module NaturalCheck = SemilatticeProp.Make(Natural)
module NatlistCheck = SemilatticeProp.Make(Natlist)
module NatsetCheck  = SemilatticeProp.Make(Natset)

let main () =
  [
    ("natural", NaturalCheck.check);
    ("natlist", NatlistCheck.check);
    ("natset",  NatsetCheck.check);
  ]
  |> List.iter (fun (name, check) -> Printf.printf "%s: %b\n\n" name (check ()))

let () = main ()
