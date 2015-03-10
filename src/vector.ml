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

let create_array n m =
    Array.make_matrix n m 0.;;

let create_array_3d n =
    create_array n 3;;

let norm2 v =
    let rec sum_square v i n =
        if i = n - 1 then
            v.(i) *. v.(i)
        else
            v.(i) *. v.(i) +. (sum_square v (i + 1) n)
    in
    (sqrt (sum_square v 0 (Array.length v)));;

let dimension v =
    Array.length v;;

let ith_compo v i =
    v.(i);;

let ith_compo_array a i =
    let n = Array.length a in
    let c = Array.create n 0. in
    for j = 0 to (n - 1)
    do
        c.(j) <- a.(j).(i);
    done;
    c;;

(** Only in 3D *)
let prod_vec a b =
    if Array.length a = 3 && Array.length b = 3 then
        let c = create 3 in
        c.(0) <- a.(1) *. b.(2) -. a.(2) *. b.(1);
        c.(1) <- b.(0) *. a.(2) -. a.(0) *. b.(2);
        c.(2) <- a.(0) *. b.(1) -. a.(1) *. b.(0);
        c;
    else
        raise (Invalid_argument "Vector.prod_vec : Must be vec3d");;

let copy a b =
    Gsarray.copy_data a b;;

let copy_array a b =
    let n = Array.length b in
    for i = 0 to (n - 1)
    do
        copy a.(i) b.(i)
    done;;

let set_ith_compo v i a =
    let n = Array.length v in
    let m = Array.length a in
    if m = n then
        for j = 0 to (n - 1)
        do
            v.(j).(i) <- a.(j);
        done
    else
        raise (Invalid_argument "Vector.copy: [v] and [a] must be the same
                                length");;
let print_array a =
    Gsarray.print_matrix_float a;;

let print v =
    Gsarray.print_array_float v;;

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
