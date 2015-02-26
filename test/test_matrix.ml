open Matrix;;

let c = [|  [|3.    ; 5.    ;   -3. |] ; 
            [|-4.   ; 0.   ;   0. |] ; 
            [|0.   ; 1.    ;   -4.5|]
        |];;
let b = [|2.    ; 1.    ; -5.|];;

Printf.printf "Matrice A avant échelonnage\n";;
Matrix.print c;;
Printf.printf "-------------------\n";;

Printf.printf "Matrice B avant échelonnage\n";;
Matrix.print_column b;;
Printf.printf "-------------------\n";;

Printf.printf "Solution du système : \n";;
Matrix.print_column (Matrix.resolve c b);;
