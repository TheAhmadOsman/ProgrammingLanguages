(* Name your file "chapter5.sml" and put your solutions to exercises 10-30 
   in here. Then you are to implement your functions so these tests pass. 
   You should know that completing the tests successfully does not mean
   you will automatically get the points. They solutions must adhere to any
   further restrictions put on your answer as described in the text. 

   You can run this file. Place this file and chapter5.sml in the same 
   directory or folder. Then from the command-line type 

   sml chap5tests.sml

   This program will load your chapter5.sml file and run the tests on it.
*)

use "chapter5.sml";


val score = ref 9;

TextIO.output(TextIO.stdOut, "You get 9 points for a good attempt.\n");

if gcd(24,18) = 6 then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 10.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 10.\n");

if (allCaps "hi there") = "HI THERE" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 11.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 11.\n");

if (firstCaps ["hello", "2", "the", "world"]) = ["Hello", "2", "The", "World"] then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 12.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 12.\n");

if (swap [1,2,3,4,5]) = [2,1,4,3,5] then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 13.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 13.\n");

if (rotate (3,[1,2,3,4,5])) = [4,5,1,2,3] then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 14.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 14.\n");

if (delete(5,"hi there")) = "hi thre" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 15.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 15.\n");

if (intpow(2,10)) = 1024 then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 16 but it must also run in O(log n) time.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 16.\n");

if (rotate2(4,explode "hi there")) = explode "herehi t" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 17 but it must also run in O(n) time where n is the number or rotates.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 17.\n");

if (rotate3(5,explode "hello")) = explode "hello" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 18 but it must also run in O(n) time where n is the size of the list.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 18.\n");

if (delete2 5 "hi there") = "hi thre" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 19.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 19.\n");

if (delete5 "hi there") = "hi thre" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 20.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 20.\n");

if (evens [1,2,3,4,8,6,5]) = [2,4,8,6] then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 21.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 21.\n");

if (lowerFirsts ["hi","There","how","ARE","you!"]) = ["hi","how","you!"] then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 22 if you used a higher order function.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 22.\n");

if (allCaps2 "hi there") = "HI THERE" then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 23 if you used a higher order function.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 23.\n");

if (find("Exercise 24", "chap5tests.sml")) = () then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 24 if three lines were printed above.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 24.\n");

if (transform (fn x => 15 div x) [1,3,0,5]) = [15,5,0,3] then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 25.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 25.\n");

if (succ(succ(succ(O)))) = (succ(succ(succ(O)))) then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 26.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 26.\n");

if (convert (succ(succ(succ(O))))) = 3 then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 27.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 27.\n");

if (convert (add ((succ(succ(succ(O)))), (succ(succ(O)))))) = 5 then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 28.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 28.\n");

if (convert (mul ((succ(succ(succ(O)))), (succ(succ(O)))))) = 6 then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 29.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 29.\n");

if (convert (hadd [succ(succ(succ(O))), succ(succ(O)), succ(O)])) = 6 then (
	score := !score + 1;
	TextIO.output(TextIO.stdOut,"Passed Test for Exercise 30.\n")
) else 
	TextIO.output(TextIO.stdOut,"Failed Test for Exercise 30.\n");

TextIO.output(TextIO.stdOut,"Your score is " ^ Int.toString(!score) ^ " out of " ^ "30 points.\n");