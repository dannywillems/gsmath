(*
 * Least square algorithm. Returns coefficient a and b in a list if the problem
 * has a solution, else an exception
*)
val least_squares : (float * float) array -> float array -> float array

(*
 * Chebyshev - Gausse - Lobatto node between a and b with n nodes
*)
val cgl_node : ?i:int -> float -> float -> int -> (float -> float) -> (float * float) list

val lagrange_evaluation_k : ?i:int -> (float * float) array -> float -> float -> float

val lagrange_evaluation : ?i:int -> (float * float) array -> float -> float
