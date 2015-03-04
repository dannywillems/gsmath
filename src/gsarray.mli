(* apply a function (first param) on each element of the array *)
val iter : ('a -> 'a) -> 'a array -> unit

val copy_data : 'a array -> 'a array -> unit

val print_matrix_float : float array array -> unit

val print_array_float : float array -> unit
