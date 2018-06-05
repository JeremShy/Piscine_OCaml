module StringHash : (Hashtbl.HashedType with type t = String.t) =
struct
	type t = String.t
	let equal i j = i = j
	let hash str = Hashtbl.hash str
end

module StringHashtbl = Hashtbl.Make (StringHash)

let () =
	let ht = StringHashtbl.create 5 in
	let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
	let pairs = List.map (fun s -> (s, String.length s)) values in
	List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
	StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
