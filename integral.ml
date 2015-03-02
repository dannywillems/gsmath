let rectangle_local f a b =
    ((f b) -. (f a)) /. (b -. a);;

let rec rectangle f a b ?(i = 0) n =
    if i = n then
        0.
    else
        let a_n0 = a +. (b -. a) /. (float n) *. (float i) in
        let a_n1 = a +. (b -. a) /. (float n) *. (float (i + 1)) in
        (rectangle_local f a_n0 a_n1) +. (rectangle f a b ~i:(i+1) n);;

(* Trapeze method implementation for integrate calculus *)

let trapeze_local f a b =
    ((f a) +. (f b)) /. 2. *. (b -. a);;

let rec trapeze f a b ?(i = 0) n =
    if i = n then
        0.
    else
        let a_n0 = a +. (b -. a) /. (float n) *. (float i) in
        let a_n1 = a +. (b -. a) /. (float n) *. (float (i + 1)) in
        (trapeze_local f a_n0 a_n1) +. (trapeze f a b ~i:(i+1) n);;
