type result_root =
{
	mutable last_output : float;
	mutable last_xn : float;
	mutable last_an : float;
	mutable last_bn : float;
	mutable error : string;
	mutable current_iter : int;
	mutable max_iter_reached : bool;
	mutable im_epsi_reached : bool
};;

type function_root = 
{
	fx : float -> float;
	a : float;
	b : float;
	im_epsi : float;
	max_iter : int
};;

let init_result fx x a b =
{
	last_output = fx;
	last_xn = x;
	last_an = a;
	last_bn = b;
	error = "";
	current_iter = 0;
	max_iter_reached = false;
	im_epsi_reached = false
};;

let update_r_root f_root r_root =
	if  r_root.last_output > 0. then
	(
		r_root.last_bn <- r_root.last_xn
	)
	else
		r_root.last_an <- r_root.last_xn;
	r_root.current_iter <- (r_root.current_iter + 1);
	r_root.max_iter_reached <- (r_root.current_iter = f_root.max_iter);
	r_root.im_epsi_reached <- (abs_float (r_root.last_output) < f_root.im_epsi)


let rec calc_bissection f_root r_root =
	if r_root.max_iter_reached || r_root.im_epsi_reached then
		r_root
	else
		(
		r_root.last_xn <- ((f_root.fx r_root.last_an) +. 
							(f_root.fx r_root.last_bn)) *. 0.5;
		r_root.last_output <- f_root.fx r_root.last_xn
		update_r_root f_root r_root
		calc_bissection f_root r_root
		)

let bissection f_root =
	let fa = (f_root.fx f_root.a) and fb = (f_root.fx f_root.b) in
	if (abs_float (fb) < f_root.im_epsi) then
		(
		let r_root = init_result fb f_root.b f_root.a f_root.b in
		r_root.im_epsi_reached <- true
		r_root
		)
	else if (abs_float (fa) < f_root.im_epsi) then
		(
		let r_root = init_result fa f_root.a f_root.a f_root.b in
		r_root.im_epsi_reached <- true
		r_root
		)
	else if fa > 0. then
		calc_bissection f_root (init_result fb f_root.b f_root.b f_root.a)
	else
		calc_bissection f_root (init_result fa f_root.a f_root.a f_root.b)

let f = 
{
	fx = (fun x -> x *. x -. 2.);
	a = 0.;
	b = 2.;
	im_epsi = 1e-14;
	max_iter = 50
};;

print_float (bissection f).last_xn;;
