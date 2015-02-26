val print_column : float array -> unit

val print : float array array -> unit

val switch_line : float array array -> int -> int -> unit


(* 
     Arguments
        a : square matrix, b : row matrix.
     Description
        echelon system with gaussian elimination and use partial pivoting.
*)
val echelon : float array array -> float array -> unit

(* Check if a triangle matrix is inversible *)
val is_inversible : float array array -> int -> ?i:int -> unit -> bool

val resolve : float array array -> float array -> float array
