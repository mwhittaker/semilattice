type t   = int
let (==) = (=)
let (%)  = max
let gen  = QCheck.Arbitrary.int 10000
let pp   = QCheck.PP.int
