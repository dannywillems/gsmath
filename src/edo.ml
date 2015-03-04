(* Euler *)

let euler f a b h0 n =
    let step = (b -. a) /. (float n) in
    let h = Array.create n h0 in
    for i = 0 to (n - 2) do
        h.(i + 1) <- h.(i) +. step *. (f (a +. step *. (float i)) (h.(i)));
    done;
    h;;

(* Middle point *)
(* TODO *)

let middle_point f a b h0 n = Array.create n h0;;

(* Runge kutta order 4 *)


(* Return the matrix associated with the fourth order Runge Kutta.
 * The matrix a is under the diagonale.
 * The matrix c is on the diagonale <- 0.;
 * a.(.iiiiaaai.
 * The (n - 1) (here n = 4) first element of b is on the first line begin to the
 * second row (a.(0).(1) --> a.(0).(n - 1) and the last element of c is on
 * a.(2).(3).
 *
 * Elements with value 0 are initialised with the array a.
 *)

let rk4_coef =
    let a = Array.make_matrix 4 4 0. in
    (* a cofficients *)
    a.(1).(0) <- 1. /. 2.;
    a.(2).(1) <- 1. /. 2.;
    a.(3).(2) <- 1.;

    (* b cofficients *)
    a.(0).(1) <- 1. /. 6.;
    a.(0).(2) <- 1. /. 3.;
    a.(0).(3) <- 1. /. 3.;
    a.(2).(3) <- 1. /. 6.;

    (* c cofficients *)
    a.(1).(1) <- 1. /. 2.;
    a.(2).(2) <- 1. /. 2.;
    a.(3).(3) <- 1.;
    a;;

(* Return the rk coefficient a_i_j *)
let rk4_coef_a n i j =
    n.(i).(j);;

(* Return the rk coefficient b_i *)
let rk4_coef_b n i =
    if i = 3 then
        n.(2).(3)
    else
        n.(0).(i);;

(* Return the rk coefficient c_i *)
let rk4_coef_c n i =
    n.(i).(i);;

let intermediate_point f t h0 step n =
    let i_point = Array.create 4 h0 in
    for i = 1 to 3 do
        for j = 0 to (i - 1) do
            i_point.(i) <-  i_point.(i) +. step *. (float (i - 1)) *. (rk4_coef_a n i j) *.
                            (f (t +. (rk4_coef_c n j) *. step) i_point.(j));
        done;
    done;
    i_point;;

let rk4 f a b h0 n =
    let step = (b -. a) /. (float n) in
    let h = Array.create n h0 in
    let coef = rk4_coef in
    let points = Array.create 4 0. in
    for i = 1 to (n - 1) do
        Gsarray.copy_data   points
                            (intermediate_point
                                f (* f *)
                                (a +. step *. (float (i - 1))) (* t *)
                                h.(i - 1) (* h0 *)
                                step (* step *)
                                coef (* n *)
                            );
        Gsarray.print_array_float points;
        for j = 0 to 3 do
            h.(i) <-    h.(i - 1) +. step *. (rk4_coef_b coef j) *.
                        (f (a +. step *. (float (i - 1)) *. (rk4_coef_c coef j))
                        points.(j))
        done;
        Printf.printf "%f\n" h.(i)
    done;
    h;;
