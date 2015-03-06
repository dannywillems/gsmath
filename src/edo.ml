(* Euler *)
let euler f a b y0 n =
    let h = (b -. a) /. (float n) in
    let y = Array.create n y0 in
    for i = 0 to (n - 2) do
        y.(i + 1) <- y.(i) +. h *. (f (a +. h *. (float i)) (y.(i)));
    done;
    y;;

(* Middle point *)
(* TODO *)
(* How to implement implicit methods ? *)

let middle_point f a b y0 n = Array.create n y0;;


(* Runge kutta order 4 *)

(* Return the matrix associated with the fourth order Runge Kutta.
 * The matrix a is under the diagonale.
 * The matrix c is on the diagonale.
 * The (n - 1) (where n = 4) first element of b is on the first line from
 * the second row (a.(0).(1) to a.(0).(n - 1)) and the last element of c is on
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

(* Return ty. rk coefficient a_i_j *)
let rk4_coef_a n i j =
    n.(i).(j);;

(* Return ty. rk coefficient b_i *)
let rk4_coef_b n i =
    if i = 3 then
        n.(2).(3)
    else
        n.(0).(i + 1);;

(* Return ty. rk coefficient c_i *)
let rk4_coef_c n i =
    n.(i).(i);;

let intermediate_point f t y0 h coef =
    let i_point = Array.create 4 y0 in
    for i = 1 to 3 do
        for j = 0 to (i - 1) do
            let aij = rk4_coef_a coef i j in
            let cj = rk4_coef_c coef j in
            i_point.(i) <-  i_point.(i) +. aij *. h *.
                            (f (t +. cj *. h) i_point.(j));
        done;
    done;
    i_point;;

let rk4 f a b y0 n =
    let h = (b -. a) /. (float n) in
    let y = Array.create n y0 in
    let coef = rk4_coef in
    let points = Array.create 4 0. in
    for i = 1 to (n - 1) do
        let ti = a +. h *. (float (i - 1)) in
        Gsarray.copy_data   points
                            (intermediate_point
                                f (* f *)
                                ti (* t *)
                                y.(i - 1) (* y0 *)
                                h (* h *)
                                coef (* n *)
                            );
        y.(i) <- y.(i - 1);
        for j = 0 to 3 do
            let bj = rk4_coef_b coef j in
            let cj = rk4_coef_c coef j in
            y.(i) <-    y.(i) +.
                        bj *. h *. (f (ti +. h *. cj) points.(j))
        done;
    done;
    y;;
