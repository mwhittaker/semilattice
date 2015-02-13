type t        = int list
let (==)      = (=)
let (%) xs ys = List.map2 max xs ys
let gen       = QCheck.Arbitrary.(list ~len:(return 10) (int 10000))
let pp        = QCheck.PP.(list int)
