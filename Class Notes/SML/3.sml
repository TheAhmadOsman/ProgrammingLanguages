fun intpow(base, 0) = 1.0
    | intpow(base, n) =
        if n mod 2 = 1 then base * base (intpow(base, n-1))
        else
            lt val r = intpow(base, n div 2)
            in
                r * r
            end

fun find(s, file) =
    let val strm = TextIO.openIn(file)
    in
        while true do
            let val line = valOf(TextIO.inputLine(strm))
            in
                if (String.isSubstring s line) then
                    TextIO.output(TextIO.stdOut, line)
                else
                    ()
            end
        end handle Option => ();

fun rotate 0 L = L
    | rotate n [] = []
    | rotate n (h::t) = rotate (n-1) (t @ [h])

fun roate2 n L = 
    let fun helprot 0 L acc = L @ (List.rev acc)
        | helprot n [] acc = helprot n (List.rev acc) []
        | helprot n (h::t) acc = helprot (n-1) t (h::acc)
    in
        helprot (n mod (List.length L)) L []
    end

fun rotate3 n L = rotate2 (n mod (List.length L)) L

datatype Natural = O | succ of Natural