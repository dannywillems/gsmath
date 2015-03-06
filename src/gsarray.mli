(**
 * Routines working on array not implemented in standard library
 * @author Danny Willems
*)


(** Apply a function (first param) on each element of the array *)
val iter : ('a -> 'a) -> 'a array -> unit

(* Copy data from the second array into the first array *)
val copy_data : 'a array -> 'a array -> unit

(* Print a matrix of float with 4 spaces between each value and a \n at the end
 * of a line
*)
val print_matrix_float : float array array -> unit

(* Print an array of float with 4 spaces between each value *)
val print_array_float : float array -> unit
