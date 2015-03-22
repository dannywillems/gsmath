exception Bad_Condition;;

let max_iter = 100;;

let condition_depart x y = 
    x *. y > 0.;;

let is_root fx =
    (abs_float fx) < 10.**(-16.);;

(* BISSECTION *)

let rec calc_bissection f a b i =
    let x = (a +. b) *. 0.5 in
    let fx = (f x) in
    if is_root fx || i >= max_iter then
        x
    else if fx > 0. then
        calc_bissection f a x (i + 1)
    else
        calc_bissection f x b (i + 1);;

let bissection f a b =
    let fa = (f a) and fb = (f b) in
    if condition_depart fa fb then
        raise Bad_Condition
    else if is_root fa then
        a
    else if is_root fb then
        b
    else if fa > 0. && fb < 0. then
        calc_bissection f b a 0
    else
        calc_bissection f a b 0;;

(* SECANTE *)

let update_secante a b fa fb =
    (a -. (b -. a) /. (fb -. fa) *. fa);;

let rec calc_secante f a b current i =
    let x = update_secante a b (f b) (f b) in
    if is_root (f x) || i >= max_iter then
        x
    else if i = 1 then
        calc_secante f a x ((current + 1) mod 2) (i + 1) 
    else
        calc_secante f x b ((current + 1) mod 2) (i + 1) ;;

let secante f a b  =
    let fa = (f a) and fb = (f b) in
    if condition_depart fa fb then
        raise Bad_Condition
    else if is_root fa then
        a
    else if is_root fb then
        b
    else if fa > 0. && fb < 0. then
        calc_secante f b a 0 0
    else
        calc_secante f a b 0 0;;

(* FAUSSE POSITION *)

let update_fausse_position a b fa fb =
     a -. (b -. a) /. (fb -. fa) *. fa;; 

let rec calc_fausse_position f a b i =
    let x = update_fausse_position a b (f a) (f b) in
    let fx = (f x) in
    if is_root fx || i >= max_iter then
        x
    else if fx > 0. then
        calc_fausse_position f a x (i + 1)
    else
        calc_fausse_position f x b (i + 1);;

let fausse_position f a b =
    let fa = (f a) and fb = (f b) in
    if condition_depart fa fb then
        raise Bad_Condition
    else if is_root fa then
        a
    else if is_root fb then
        b
    else if fa > 0. && fb < 0. then
        calc_fausse_position f b a 0
    else
        calc_fausse_position f a b 0;;

(* NEWTON *)

let update_newton xn f_xn df_xn =
    xn -. f_xn /. df_xn;;

let rec newton f xn df =
    let fxn = (f xn) in
    if is_root fxn then
        xn
    else
        newton f (update_newton xn fxn (df xn)) df;;
