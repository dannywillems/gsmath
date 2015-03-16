(**
 * This module provides some routines about vecor of R^n.
 * Vector are represented by float array of n elements.
 *
 * @author Danny Willems
 *)

(* -------------------------------------------------------------------------- *)
type vec = float array
type vec3d = float array
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(** Create a new vecor initialized at 0. *)
val create : int -> vec

(** Create a new vecor3d initialized with value [x] [y] [z] *)
val init_3d : float -> float -> float -> vec3d

(** Create an array of vector initialized at 0 *)
val create_array : int -> int -> vec array

(** Create an array of vector 3d initialized at 0 *)
val create_array_3d : int -> vec3d array

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(** Get the ith composante of a vector *)
val ith_compo : vec -> int -> float

(** Get the ith composante of each vector in an array of vector. It returns a
 * float array
 *)
val ith_compo_array : vec array -> int -> float array

(** Space where lives vec ie R^n where n is his length *)
val dimension: vec -> int

(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* ---- COPY FUNCTIONS ---- *)
(** Copy a vector *)
val copy : vec -> vec -> unit

(** Copy an array of vector *)
val copy_array : vec array -> vec array -> unit
(* -------------------------------------------------------------------------- *)


(* -------------------------------------------------------------------------- *)
(** Return the euclidian norm *)
val norm2 : vec -> float

(** Vectorial product. Only in 3d ! *)
val prod_vec : vec3d -> vec3d -> vec3d
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(** set_ith_compo [v] [i] [a]
 *  Set a as the ith composant of v
 *)
val set_ith_compo : vec array -> int -> float array -> unit

val sub_array : vec array -> int -> int -> vec array
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* ---- PRINTING FUNCTIONS ---- *)

(** Print array of vector *)
val print_array : vec array -> unit

(** Print a vector *)
val print : vec -> unit
(* -------------------------------------------------------------------------- *)

(** Infix on vecor 
 *  It's in a submodule to be able to use directly the operations by open
 *  Vector.Infix.
 *)
module Infix :
sig
    (** Add and substract two float array in a new float array *)
    val ( ++. ) : vec -> vec -> vec
    val ( +=. ) : vec -> vec -> unit
    val ( -=. ) : vec -> vec -> unit
    val ( --. ) : vec -> vec -> vec

    (** Scalar multiplication *)
    val ( **. ) : float -> vec -> vec
end
