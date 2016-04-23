(*
 * Least square algorithm. Returns coefficient a and b in a list if the problem
 * has a solution, else an exception
*)
val least_squares : (float * float) array -> float array -> float array

(*
 * Chebyshev - Gausse - Lobatto node between a and b with n nodes
*)
val cgl_node :  ?i:int -> float -> float -> int -> (float -> float)
                -> (float * float) list

val sum : (int -> float) -> int -> int -> float

val product : (int -> float) -> int -> int -> float

val lagrange : float array -> int -> float -> float

val derivative_lagrange : float array -> int -> float -> float

val lagrange_evaluation : float array -> float array -> float -> float

val derivative_lagrange_evaluation : float array -> float array -> float -> float
