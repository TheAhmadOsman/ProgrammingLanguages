fun append nil L = L
    | append (h::t) L = h :: (append t L)

fun reverse nil = nil
    | reverse (h::t) = append (reverse t) [h]

This is a curried function:
fun reverse L = 
    let fun helprev nil acc =
        | helprev(h::t) acc = helprev t (h::acc)
    in
        helprev L
    end

Uncurried function should have paranthesis and commas.

Explaination, needs to commented out:
                t
           h::[2, 3]
  helprev [1, 2, 3] []
= helprev [2, 3] [1]
= helprev [3] [2, 1]
= helprev [] [3, 2, 1]

Don't use append in question 17, you shouldn't use it in each recursive call but you can use it once. Follow the above example to write down the rotate(17 exercise)..

The following is a definition of a pre-defined library
fun foldr f init [x] = f (x, init)
    | foldr f init (h::t) = f(h, foldr f t init)

Does this:
1 + (2 + (3 + (4 + (5 + 0 ))))