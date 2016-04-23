open Matrix;;

(* Used by CGL distribution *)
let pi = acos(-1.)

(* -------------------------------------------------------------------------- *)
(*
 * Least squares algorithms. Return [a, b] where a and b are coefficient of ax+b
 * if the system is resolvable, else an exception
*)
let least_squares points w =
    let a = Array.make_matrix 2 2 0. in
    let b = Array.make 2 0. in
    let n = Array.length points in

    a.(1).(1) <- float(n);
    for i = 0 to (n - 1) do
        let (x, y) = points.(i) in
        a.(0).(0) <- a.(0).(0) +. x *. x *. w.(i);
        a.(0).(1) <- a.(0).(1) +. x *. w.(i);
        a.(1).(0) <- a.(0).(1); (* symetric matrix *)
        b.(0) <- b.(0) +. x *. y *. w.(i);
        b.(1) <- b.(1) +. y *. w.(i);
    done;

    Matrix.resolve a b
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(*
 * ------------------------
 * Lagrangian interpolation
 * ------------------------
*)

(* Chebyshev - Gausse - Lobatto nodes distribution with image respectively to a
 * given function f
*)
let rec cgl_node ?(i = 0) a b n f =
    if i = n then
        [(b, (f b))]
    else
        let x = (a +. b) /. 2. -. (b -. a) /. 2. *. cos(pi /. float(n) *.
        float(i)) in
        (x, (f x)) :: cgl_node ~i:(i + 1) a b n f
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* k-ième composante of Lagrange polynomial basis evaluation *)

(* Tail call version of the sum
 * Σ[i -> n] f(i) *)
let sum f i n =
  let rec it f i n sum =
    if i = n then
      (f i) +. sum
    else
      it f (i+1) n (sum +. (f i))
  in
  it f i n 0.

(* Tail call version of the product
 * Π[i -> n] f(i) *)
let product f i n =
  let rec it f i n product =
    if i = n then
      (f i) *. product
    else
      it f (i+1) n (product *. (f i))
  in
  it f i n 1.

(* Computes the Lagrange polynomial of index i, Li(x)
 * v is the vector such that p(vi) = yi *)
let lagrange v i x =
  let lagrange_quotient j =
    if j = i then 1.
    else (x -. v.(j)) /. (v.(i) -. v.(j))
  in
  product lagrange_quotient 0 ((Array.length v) - 1)

(* Computes the derivate of the Lagrange polynomial Li'(x)
 * such that p(vi) = yi *)
let lagrange' v i x =
  let f j =
    if j = i then 0.
    else 1. /. (v.(i) -. v.(j))
  in
  sum f 0 ((Array.length v) - 1)

(* Lagrange polynomial evaluation *)
let lagrange_evaluation v y x =
  let lagrange_sum i =
    y.(i) *. ( lagrange v i x )
  in
  sum lagrange_sum 0 ((Array.length y) - 1)

(* Lagrange derivative evaluation *)
let lagrange'_evaluation v y x =
  let f i =
    y.(i) *. (lagrange' v i x)
  in
  sum f 0 ((Array.length y) - 1)

(* -------------------------------------------------------------------------- *)
