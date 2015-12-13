let iter f a =
    let n = Array.length a in
    for i = 0 to (n - 1) do
        a.(i) <- (f a.(i))
    done

let copy_data a b =
    let n = Array.length a in
    if n = Array.length b then
        for i = 0 to (n - 1) do
            a.(i) <- b.(i)
        done

let print_array_float a =
    let n = Array.length a in
    for i = 0 to (n - 1) do
        if i = n - 1 then
            Printf.printf "%f" a.(i)
        else
            Printf.printf "%f    " a.(i)
    done;
    Printf.printf "\n"

let print_matrix_float a =
    let n = Array.length a in
    for i = 0 to (n - 1) do
        print_array_float a.(i);
    done
