(**
 * Module EDO
 * @author Danny Willems
*)

(* Euler method (recursive)
 * f : [a, b] x R -> R
 * h : points list calculated. Must be initialized with the initial condition.
 * n : number of points
*)

val euler : ((float -> float) -> float) -> float -> float -> float -> int
            -> float array
