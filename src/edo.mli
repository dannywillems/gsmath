(**
 * Routines to resolve first order ordinary differential equation
 * @author Danny Willems
*)

(* The parameters are:
 * f : [a, b] x R^n -> R^n : the function representing the differential equation
 * y0 : initial condition
 * n : number of points
*)

(** Euler method *)
val euler : (float -> Vector.vec -> Vector.vec) -> float -> float
            -> Vector.vec -> int
            -> Vector.vec array

(** Runge Kutta order 4 *)
val rk4 :   (float -> Vector.vec -> Vector.vec) -> float -> float
            -> Vector.vec -> int
            -> Vector.vec array
