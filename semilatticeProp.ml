module Make (S: Semilattice.S) = struct
  open S

  let pair     = QCheck.Arbitrary.pair gen gen
  let triple   = QCheck.Arbitrary.pair gen pair
  let pppair   = QCheck.PP.pair pp pp
  let pptriple = QCheck.PP.pair pp pppair

  let associativity =
    let prop = fun (a, (b, c)) -> (a % b) % c == a % (b % c) in
    QCheck.mk_test ~pp:pptriple ~name:"associativity" triple prop

  let commutativity =
    let prop = fun (a, b) -> a % b == b % a in
    QCheck.mk_test ~pp:pppair ~name:"commutativity" pair prop

  let idempotency =
    let prop = fun a -> a % a == a in
    QCheck.mk_test ~pp ~name:"idempotency" gen prop

  let check () =
    QCheck.run_tests [associativity; commutativity; idempotency]
end
