(**
 * Routines to resolve first order ordinary differential equation
 * @author Danny Willems
*)

(* The parameters are:
 * f : [a, b] x R -> R : the function representing the differential equation
 * y0 : initial condition
 * n : number of points
*)

(** Euler method *)
val euler : (float -> float -> float) -> float -> float -> float -> int
            -> float array

(** Runge Kutta order 4 *)
val rk4 :   (float -> float -> float) -> float -> float -> float -> int
            -> float array
