(** Module for integrate calculus.
 * Methods implemented :
     * Trapeze
     * Rectangle
 @author Danny Willems
*)

val rectangle: (float -> float) -> float -> float -> ?i:int -> int -> float

val trapeze: (float -> float) -> float -> float -> ?i:int -> int -> float
