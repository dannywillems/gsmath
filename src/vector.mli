(**
 * This module provides some routines about vector of R^n.
 * Vector are represented by float array of n elements.
 *
 * @author Danny Willems
 *)

module TypeDef :
sig
    type vect
    type vect3d
end

open TypeDef

(** Create a new vector initialized at 0. *)
val create : int -> vect

(** Create a new vector3d initialized with value [x] [y] [z] *)
val init_3d : float -> float -> float -> vect3d

val set : vect -> int -> float -> unit

val get : vect -> int -> float

(** Return the euclidian norm *)
val norm2 : vect -> float

(** Copy *)
val copy : vect -> vect -> unit

(** Vectorial product. Only in 3d ! *)
val prod_vect : vect3d -> vect3d -> vect3d

(** Operation on vector 
 *  It's in a submodule to be able to use directly the operations by open
 *  Vector.Operation.
 *)
module Operation :
sig
    (** Add two float array in a new float array *)
    val ( ++. ) : vect -> vect -> vect

    (** Scalar multiplication *)
    val ( **. ) : float -> vect -> vect
end
