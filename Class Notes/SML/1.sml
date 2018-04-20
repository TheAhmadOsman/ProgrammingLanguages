(*
  https://learnxinyminutes.com/docs/standard-ml/
  http://knuth.luther.edu/~leekent/PL/functional.html
  http://sml-family.org/Basis/string.html#SIG:STRING.size:VAL
*)

fun f(x) = x * x;

f(2)

fun fact(x) =
    if x = 0 then 1 else fact(x-1) * x

fun explode(s) =
    if s = "" then []
    else String.sub(s, 0) :: (explode (String.substring(s, 1, String.size(s)-1)))

(*
    append [1, 2][3, 4]
    = 1 :: (append[2][3, 4])
    = 1 :: (2 :: (append [][3, 4]))
    = 1 :: (2 :: [3, 4])
    = [1, 2, 3, 4]

               head      ::      tail
                1                 ::
                            2           ::
                                    3       ::
                                        4       nil
*)

fun reverse L =
    if L = [] then []
    else (reverse(tl L)) @ [(hd L)] (* [4,3,2] @ [1] *)

fun patternreverse nil = nil
    | prev (h::t) = (prev t) @ [h]

(*
  let val x = 6
  in 
    let val x = x+1
    in
        x
    end;
    x
  end;
*)