(** Module for integrate calculus.
 * Methods implemented :
     * Trapeze
     * Rectangle
 @author Danny Willems
*)

(** interval [a] [b] [n]
 * Returns the array a, a + 1/n * b, a + 2/n * b, ... b
 *)
val interval: float -> float -> int -> float array

(** rectangle [f : R -> R] [a] [b] [n]
 * Integrate f on the interval [a, b] with the rectangle method
 * TODO: Use rectangle withouth the counter. Not yet done because some code
 * depends on that.
 *)
val rectangle: (float -> float) -> float -> float -> ?i:int -> int -> float

(** trapeze [f : R -> R] [a] [b] [n]
 * Integrate f on the interval [a, b] with the trapeze method
 *)
val trapeze: (float -> float) -> float -> float -> ?i:int -> int -> float

val trapeze_point: float array -> float array -> float -> float array
