open Integral;;
open Printf;;

let f x = x *. x;;

Printf.printf "Trapeze 50 : %f\n" (Integral.trapeze f 0. 1. 50);;
Printf.printf "Trapeze 100 : %f\n" (Integral.trapeze f 0. 1. 100);;
Printf.printf "Trapeze 500 : %f\n" (Integral.trapeze f 0. 1. 500);;
Printf.printf "Trapeze 1000 : %f\n" (Integral.trapeze f 0. 1. 1000);;
Printf.printf "Trapeze 2000 : %f\n" (Integral.trapeze f 0. 1. 2000);;

