let iter f a =
    let n = Array.length a in
    for i = 0 to (n - 1) do
        a.(i) <- (f a.(i));
    done;;
