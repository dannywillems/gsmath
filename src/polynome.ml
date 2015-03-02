open Gsarray;;

(*
    A polynome of degree n is given by a n-uple where the ith composante
    represents the ith coefficent of the polynome.
*)

let rec eval ?(x_t = 1.) ?(i = 0) polynome x n =
    if i = n then
        0.
    else
        polynome.(i) *. x_t +.
        (eval ~x_t:(x_t *. x) ~i:(i + 1) polynome x n);;

let mult_by_coef poly coef =
    Gsarray.iter (fun x -> x *. coef) poly;;
