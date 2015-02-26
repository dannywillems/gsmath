open Interpolation;;
open Matrix;;

let a = Array.make 2 (0., 0.);;
a.(0) <- (1., 2.);;
Matrix.print_column (least_squares a (Array.make 2 1.));;
