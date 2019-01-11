(* Ahmad M. Osman *)
exception eofException;

datatype
  AST = add' of AST * AST
      | sub' of AST * AST
      | prod' of AST * AST
      | div' of AST * AST
      | negate' of AST
      | integer' of int
      | store' of AST
      | input' 
      | recall';

fun E ("+"::rest) =
  let val (ast1,rest1) = E(rest)
    val (ast2,rest2) = E(rest1)
  in
    (add'(ast1,ast2),rest2)
  end
  | E ("-"::rest) =
  let val (ast1,rest1) = E(rest)
    val (ast2,rest2) = E(rest1)
  in
    (sub'(ast1,ast2),rest2)
  end
  | E ("*"::rest) =
  let val (ast1,rest1) = E(rest)
    val (ast2,rest2) = E(rest1)
  in
    (prod'(ast1,ast2),rest2)
  end
  | E ("/"::rest) =
  let val (ast1,rest1) = E(rest)
    val (ast2,rest2) = E(rest1)
  in
    (div'(ast1,ast2),rest2)
  end
  | E ("~"::rest) =
  let val (ast,rest1) = E(rest)
  in
    (negate'(ast),rest1)
  end
   | E ("S"::rest) =
  let val (ast,rest1) = E(rest)
  in
    (store'(ast),rest1)
  end
  | E ("R"::rest) = (recall',rest)
  | E ("I"::rest) = (input',rest)
  | E (x::rest) =
    let val i = valOf(Int.fromString(x))
    in
      (integer'(i),rest)
    end
  | E nil = raise eofException;

(* return the index of an item in a list *)
fun indexOf ((v:string),nil)  = raise Subscript 
  | indexOf (v,h::t) = if h = v then 0 
    else 1+(indexOf(v,t));

(* constantsOf returns a list of the constants of the AST *)
fun constantsOf(add'(t1,t2)) =
      (constantsOf t1) @ (constantsOf t2)
  | constantsOf(sub'(t1,t2)) =
      (constantsOf t1) @ (constantsOf t2)
  | constantsOf(prod'(t1,t2)) =
      (constantsOf t1) @ (constantsOf t2)
  | constantsOf(div'(t1,t2)) =
      (constantsOf t1) @ (constantsOf t2)
  | constantsOf(negate'(t)) = constantsOf(t)
  | constantsOf(store'(t)) = constantsOf(t)
  | constantsOf(recall') = []
  | constantsOf(input') = []
  | constantsOf(integer'(x)) = [Int.toString(x)]

fun delimiter #" " = true
  | delimiter #"\t" = true
  | delimiter #"\n" = true
  | delimiter _ = false

fun run() =
  (TextIO.output(TextIO.stdOut,"Please enter a prefix calculator expression: ");
   TextIO.flushOut(TextIO.stdOut);
   let val line = TextIO.inputLine(TextIO.stdIn)
       val tokens = String.tokens delimiter (valOf line)
       val out = TextIO.openOut("a.casm")
       val (ast,remainingTokens) = E(tokens)
       val constants = constantsOf(ast)
       val allconstants = ["None", "-1", "0", "'The answer is: '", "'Please enter a number: '"] @ constants
       val stringvalues = "None, " ^ "-1, " ^ "0, "^"'The answer is: ',"^ "'Please enter a number: '"^
       (List.foldr (fn (x, y) => ", " ^x^y)"" constants)
      
      fun codegen(out,add'(t1,t2)) =
            (codegen(out,t1);
            codegen(out,t2);
            TextIO.output(out,"    BINARY_ADD\n")
            )
        | codegen(out,sub'(t1,t2)) =
            (codegen(out,t1);
            codegen(out,t2);
            TextIO.output(out,"    BINARY_SUBTRACT\n")
            )
        | codegen(out,prod'(t1,t2)) =
            (codegen(out,t1);
            codegen(out,t2);
            TextIO.output(out,"    BINARY_MULTIPLY\n") )
        | codegen(out,div'(t1,t2)) =
            (codegen(out,t1);
            codegen(out,t2);
            TextIO.output(out,"    BINARY_TRUE_DIVIDE\n")
            )
        | codegen(out,negate'(t)) =
            (TextIO.output(out,"    LOAD_CONST " ^Int.toString(indexOf("0",allconstants)) ^"\n");
            codegen(out,t);
            TextIO.output(out,"    BINARY_SUBTRACT\n")
            )
        | codegen(out,store'(t)) =
          (codegen(out,t);
          TextIO.output(out,"    STORE_FAST 0\n");
          TextIO.output(out,"    LOAD_FAST 0\n") 
          )
        | codegen(out,recall') = (TextIO.output(out,"    LOAD_FAST 0\n"))
        |codegen(out, input') =
          let val index = indexOf("'Please enter a number: '", allconstants)
          in 
          TextIO.output(out, "    LOAD_GLOBAL  2\n");
          TextIO.output(out, "    LOAD_GLOBAL  1\n");
          TextIO.output(out, "    LOAD_CONST " ^ Int.toString(index)^"\n");
          TextIO.output(out, "    CALL_FUNCTION " ^ Int.toString(1)^"\n");
          TextIO.output(out, "    CALL_FUNCTION " ^ Int.toString(1)^"\n")
          end
        | codegen(out,integer'(x)) = 
          let val index = indexOf(Int.toString(x),allconstants)
          in 
            TextIO.output(out, "    LOAD_CONST " ^ Int.toString(index)^ "\n")
          end
    in
      if length(remainingTokens) <> 0 then
        raise(eofException)
      else ();
      TextIO.output(out, "Function: main/0\n");
      TextIO.output(out, "Constants: "^ stringvalues ^ "\n");
      TextIO.output(out, "Locals: " ^ "memory\n");
      TextIO.output(out, "Globals: " ^ "print, " ^ "input, " ^ "int\n");
      TextIO.output(out, "BEGIN\n");
      TextIO.output(out, "    LOAD_GLOBAL 0\n");
      TextIO.output(out, "    LOAD_CONST " ^ Int.toString(indexOf("'The answer is: '",allconstants))^"\n");
      codegen(out,ast);
      TextIO.output(out,"    CALL_FUNCTION 2\n    RETURN_VALUE\nEND");
      TextIO.closeOut out
    end
    handle eofException =>
              TextIO.output(TextIO.stdOut,"You entered an invalid prefix expression.\n")
            | Option =>
              TextIO.output(TextIO.stdOut,"You entered invalid characters in the prefix expression.\n"))

(* enter run(); to execute *)