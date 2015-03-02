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
