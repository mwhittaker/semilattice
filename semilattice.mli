module type QCheckable = sig
  type t
  val gen: t QCheck.Arbitrary.t
  val pp:  t QCheck.PP.t
end

module type S = sig
  type t
  val (==): t -> t -> bool
  val (%):  t -> t -> t

  include QCheckable with type t := t
end
