module NatSet = Set.Make (struct
  type t = int
  let compare = compare
end)

type t   = NatSet.t
let (==) = NatSet.equal
let (%)  = NatSet.union

let gen  =
  let set_of_list = List.fold_left (fun s x -> NatSet.add x s) NatSet.empty in
  QCheck.Arbitrary.(map (list (int 10000)) set_of_list)

let pp s =
  QCheck.PP.(list int (NatSet.elements s))
