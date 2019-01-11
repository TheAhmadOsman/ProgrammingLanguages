1e(addNode(T1,T2)) --> ['+'], e(T1), e(T2).
2e(subNode(T1, T2)) --> ['-'], e(T1), e(T2).
3e(mulNode(T1, T2)) --> ['*'], e(T1), e(T2).
4e(divNode(T1, T2)) --> ['/'], e(T1), e(T2).
5e(negateNode(T)) --> ['~'] , e(T).
6e(storeNode(T)) --> ['s'] , e(T).
7e(recallNode) --> ['r'].
8e(numNode(N)) --> [num(N)].

preprocess([], []).

preprocess([H|T], [num(H)|NT]) :- number(H), preprocess(T, NT), !.
preprocess([H|T], [H|NT]) :- preprocess(T,NT).

; The last two lines can be replaces with:

preprocess([H|T], [num(H)|NT]) :- number(H), preprocess(T, NT).
preprocess([H|T], [H|NT]) :- not (number(H)), preprocess(T,NT).

decorate(addNode(AST1, AST2), MIN, MOUT2, VAL) :- decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2, VAL2), VAL is VAL1 + VAL2.

decorate(subNode(AST1, AST2), MIN, MOUT2, VAL) :- decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2, VAL2), VAL is VAL1 - VAL2.

decorate(mulNode(AST1, AST2), MIN, MOUT2, VAL) :- decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2, VAL2), VAL is VAL1 * VAL2.

decorate(divNode(AST1, AST2), MIN, MOUT2, VAL) :- decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2, VAL2), VAL is VAL1 / VAL2.

decorate(storeNode(AST)), MIN, VAL, VAL) :- decorate(AST, MIN, _, VAL).

decorate(negateNode(AST), MIN, MOUT, X) :- decorate(AST, MIN, MOUT, VAL), X is -1 * VAL.

calc :- readln(L, _, _, lowercase), preprocess(L, NL), e(Tree, NL, []), nl, print(Tree)