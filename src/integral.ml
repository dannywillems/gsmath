let interval a b n =
    let step = (b -. a) /. (float n) in
    let c = Array.create n 0. in
    c.(0) <- a;
    for i = 1 to (n - 1)
    do
        c.(i) <- a +. (float i) *. step;
    done;
    c

let rectangle_local f a b =
    ((f b) -. (f a)) /. (b -. a)

let rec rectangle f a b ?(i = 0) n =
    if i = n then
        0.
    else
        let a_n0 = a +. (b -. a) /. (float n) *. (float i) in
        let a_n1 = a +. (b -. a) /. (float n) *. (float (i + 1)) in
        (rectangle_local f a_n0 a_n1) +. (rectangle f a b ~i:(i+1) n)

(** Trapeze method implementation for integrate calculus *)
let trapeze_local f a b =
    ((f a) +. (f b)) *. 0.5 *. (b -. a)

let rec trapeze f a b ?(i = 0) n =
    if i = n then
        0.
    else
        let a_n0 = a +. (b -. a) /. (float n) *. (float i) in
        let a_n1 = a +. (b -. a) /. (float n) *. (float (i + 1)) in
        (trapeze_local f a_n0 a_n1) +. (trapeze f a b ~i:(i+1) n)

let rec trapeze_point x y ci =
    let n = Array.length x in
    let a = Array.create n 0. in
    a.(0) <- ci;
    for i = 1 to n - 1
    do
        a.(i) <-    a.(0) +. a.(i - 1) +.
                    0.5 *. (y.(i) +. y.(i - 1)) *. (x.(i) -. x.(i - 1));
    done;
    a
