open Vector.TypeDef

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
val euler : (float -> vect -> vect) -> float -> float
            -> vect -> int
            -> vect array

(** Runge Kutta order 4 *)
val rk4 :   (float -> vect -> vect) -> float -> float
            -> vect -> int
            -> vect array
