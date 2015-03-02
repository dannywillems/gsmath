(**
 * Module EDO
 * @author Danny Willems
*)

(* Euler method (recursive)
 * f : [a, b] x R -> R
 * h : points list calculated. Must be initialized with the initial condition.
 * n : number of points
*)
val Euler:  ((float * float) -> float) -> float -> float -> float array
            -> int
            -> float array;;
