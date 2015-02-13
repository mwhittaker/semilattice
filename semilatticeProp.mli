module Make (S: Semilattice.S) : sig
  val associativity: QCheck.test
  val commutativity: QCheck.test
  val idempotency: QCheck.test
  val check: unit -> bool
end
