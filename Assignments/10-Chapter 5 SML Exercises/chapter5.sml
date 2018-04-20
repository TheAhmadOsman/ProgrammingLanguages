(* Ahmad M. Osman *)

(* Exercise #10 *)
fun gcd (x: int, y: int) =
    if y = 0 then x
    else gcd(y, x mod y)

(* Exercise #11 *)
(* http://sml-family.org/Basis/string *)
fun allCaps myStr: string =
    if size(myStr) = 1 then String.str(Char.toUpper(String.sub(myStr, 0)))
    else String.str(Char.toUpper(String.sub(myStr, 0))) ^ allCaps(String.extract(myStr, 1, NONE))

(* Exercise #12 *)
fun firstCaps myList =
    if myList = [] then []
    else String.concat([String.str(Char.toUpper(String.sub(List.hd(myList), 0))), (String.extract(List.hd(myList), 1, NONE))])::firstCaps(List.tl(myList))

(* Exercise #13 *)
fun swap (x::y::xs) = y::x::swap xs
  | swap [x] = [x]  (* Base case *)
  | swap [] = []  (* Base case *)

(* Exercise #14 *)
fun rotate(0, myList) = myList
    | rotate(n, myList) = List.drop(myList, n)@List.take(myList, n)

(* Exercise #15 *)
fun deleteHelper(n, myList) = implode(List.take(myList, n)@List.drop(myList, n+1))
fun delete(n, myStr) = deleteHelper(n, String.explode(myStr))

(* Exercise #16 *)
fun intpow(base, 0) = 1
    | intpow(base, power) = 
        if power mod 2 = 1
            then base * intpow(base * base, (power - 1) div 2)
        else intpow(base * base, power div 2)

(* Exercise #17 *)
fun rotate2(0, myList) = myList
    | rotate2(n, x::xs) = rotate2(n - 1, xs@[x])
    | rotate2(n, nil) = nil

(* Exercise #18 *)
fun rotate3Helper(0, x::xs) = x::xs
    | rotate3Helper(n, x::xs) = rotate3Helper(n-1, xs)@[x]
    | rotate3Helper(n, nil) = nil
fun rotate3(n, myList) = rotate3Helper(n mod List.length(myList), myList)

(* Exercise #19 *)
fun delete2(n:int) myStr = deleteHelper(n, String.explode(myStr))

(* Exercise #20 *)
fun delete5(myStr) = delete(5, myStr)

(* Exercise #21 *)
(* Higher-order function *)
fun applyFN(function, nil) = []
    | applyFN(function, x::xs) = function(x)@applyFN(function, xs)

fun isEven(x) = if x mod 2 = 0 then [x] else []
fun evens(myList) = applyFN(isEven, myList)

(* Exercise #22 *)
fun isLower(myStr) = if Char.isLower(List.hd(String.explode(myStr))) then [myStr] else []
fun lowerFirsts(myList) = applyFN(isLower, myList)

(* Exercise #23 *)
fun toUpper(char) = [Char.toUpper(char)]
fun allCaps2(myStr) = String.implode(applyFN(toUpper, String.explode(myStr)))

(* Exercise #24 *)
fun fileToStrList(filename) =
    let val file = TextIO.openIn filename
    val txt = TextIO.inputAll file
    val _ = TextIO.closeIn file
in String.tokens(fn c => c = #"\n") txt
end

fun printStr(nil, target:string) = []
    | printStr(x::xs, target:string) = if String.isSubstring target x then (TextIO.print(x^"\n"); printStr(xs, target))
    else
        printStr(xs, target)

fun find(target:string, filename) = (printStr(fileToStrList(filename), target);())

(* Exercise #25 *)
fun rndFn(ar) b = [ar b handle except => b]

fun transform(items) nil = []
    | transform(items) myList = applyFN(rndFn(items), myList);
    transform(fn x => 15 div x)[1, 2, 3, 4];

(* Exercise #26 *)
fun succ(O) = O + 1;
datatype Natural = O
    | succ of Natural

(* Exercise #27 *)
fun convert(n: Natural): int = 
    case n of O => 0
    | succ(m) => 1 + convert(m)

(* Exercise #28 *)
fun add(num1: Natural, num2: Natural): Natural =
    case num1 of O => num2
    | succ(num_1) => add(num_1, succ(num2))

(* Exercise #29 *)
fun mul(num1: Natural, num2: Natural): Natural =
    case num1 of O => O
    | succ(num_1)=> add(num2, mul(num_1,num2))

(* Exercise #30 *)
fun hadd(myList)= List.foldr add O myList;