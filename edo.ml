(* Euler *)

let Euler_rec f a b h i n step =
    if i = n then
        h
    else
        h;;

let Euler f a b h0 n =
    Euler_rec f a b (Array.create n h0) 0 n ((b -. a) /. (float n));;



(* Middle point *)


