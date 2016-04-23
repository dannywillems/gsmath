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
let rec lagrange_evaluation_k ?(i = 0) points x_k a =
    if i = Array.length points then
        1.
    else
        let (x_i, y_i) = points.(i) in
        if x_i <> x_k then
            (a -. x_i) /. (x_k -. x_i) *. (lagrange_evaluation_k ~i:(i
        + 1) points x_k a)
        else
            (lagrange_evaluation_k ~i:(i + 1) points x_k a)

(* Lagrande polynomial evaluation based on lagrange_evaluation_k *)
let rec lagrange_evaluation ?(i = 0) points a =
    if i = Array.length points then
        0.
    else
        let x_i, y_i = points.(i) in
        y_i *. (lagrange_evaluation_k points x_i a) +. (lagrange_evaluation
        ~i:(i + 1) points a)
(* -------------------------------------------------------------------------- *)

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


(* Computes the derivate of the Lagrange polynomial Li'(x_i)
 * such that it exists an index i, x.(i) = x_i and p(x_i) = y_i *)
let lagrange' x i =
  let f j =
    if j = i then 0.
    else 1. /. (x.(i) -. x.(j))
  in
  sum f 0 ((Array.length x) - 1)

let lagrange'_evaluation x y =
  let f i =
    y.(i) *. (lagrange' x i)
  in
  sum f 0 ((Array.length y) - 1)
