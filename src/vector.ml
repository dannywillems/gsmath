type vec = float array
type vec3d = float array

let create n =
    Array.create n 0.;;

let init_3d x y z =
    let a = Array.create 3 0. in
    a.(0) <- x;
    a.(1) <- y;
    a.(2) <- z;
    a;;

let norm2 v =
    let rec sum_square v i n =
        if i = n - 1 then
            v.(i) *. v.(i)
        else
            v.(i) *. v.(i) +. (sum_square v (i + 1) n)
    in
    (sqrt (sum_square v 0 (Array.length v)));;

(** Only in 3D *)
let prod_vec a b =
    if Array.length a = 3 && Array.length b = 3 then
        let c = create 3 in
        c.(0) <- a.(1) *. b.(2) -. a.(2) *. b.(1);
        c.(1) <- b.(0) *. a.(2) -. a.(0) *. b.(2);
        c.(2) <- a.(0) *. b.(1) -. a.(1) *. b.(0);
        c;
    else
        raise (Invalid_argument "Must be vec3d");;

let copy a b =
    Gsarray.copy_data a b;;

let copy_array a b =
    for i = 0 to Array.length b
    do
        Gsarray.copy_data a.(0) b.(0)
    done;;

module Infix =
struct
    let ( ++. ) a b =
        let n = Array.length a in
        let c = Array.create n 0. in
        for i = 0 to (n - 1) do
            c.(i) <- a.(i) +. b.(i)
        done;
        c;;

    let ( **. ) a x =
        let n = Array.length x in
        let c = Array.create n 0. in
        for i = 0 to (n - 1) do
            c.(i) <- a *. x.(i)
        done;
        c;;
end
