(** Module for integrate calculus.
 * Methods implemented :
     * Trapeze
     * Rectangle
 @author Danny Willems
*)

val interval: float -> float -> int -> float array

val rectangle: (float -> float) -> float -> float -> ?i:int -> int -> float

val trapeze: (float -> float) -> float -> float -> ?i:int -> int -> float

val trapeze_point: float array -> float array -> float -> float array
