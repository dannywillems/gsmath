(**
 * This module provides some routines about vecor of R^n.
 * Vector are represented by float array of n elements.
 *
 * @author Danny Willems
 *)

type vec = float array
type vec3d = float array

(** Create a new vecor initialized at 0. *)
val create : int -> vec

(** Create a new vecor3d initialized with value [x] [y] [z] *)
val init_3d : float -> float -> float -> vec3d

(** Return the euclidian norm *)
val norm2 : vec -> float

(** Copy a vector *)
val copy : vec -> vec -> unit

(** Copy an array of vector *)
val copy_array : vec array -> vec array -> unit

(** Vectorial product. Only in 3d ! *)
val prod_vec : vec3d -> vec3d -> vec3d

(** Infix on vecor 
 *  It's in a submodule to be able to use directly the operations by open
 *  Vector.Infix.
 *)
module Infix :
sig
    (** Add two float array in a new float array *)
    val ( ++. ) : vec -> vec -> vec

    (** Scalar multiplication *)
    val ( **. ) : float -> vec -> vec
end
