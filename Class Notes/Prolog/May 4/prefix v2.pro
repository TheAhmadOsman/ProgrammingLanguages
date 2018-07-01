e(addNode(T1, T2)) --> ['+'], e(T1), e(T2).
e(subNode(T1, T2)) --> ['-'], e(T1), e(T2).
e(mulNode(T1, T2)) --> ['*'], e(T1), e(T2).
e(divNode(T1, T2)) --> ['/'], e(T1), e(T2).
e(negateNode(T)) --> ['~'], e(T).
e(storeNode(T)) --> ['s'], e(T).
e(recallNode)  --> ['r'].
e(numNode(N)) --> [num(N)].

preprocess([], []).
preprocess([H|T], [num(H)|NT]) :- number(H), preprocess(T, NT).
preprocess([H|T], [H|NT]) :- not(number(H)), preprocess(T, NT).

decorate(addNode(AST1, AST2), MIN, MOUT2, VAL)  :- 
decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2,VAL2), VAL is VAL1 + VAL2.
decorate(subNode(AST1, AST2), MIN, MOUT2, VAL)  :- 
decorate(AST1, MIN, MOUT1, VAL1),decorate(AST2, MOUT1, MOUT2,VAL2), VAL is VAL1 - VAL2.
decorate(mulNode(AST1, AST2), MIN, MOUT2, VAL)  :- 
decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2,VAL2), VAL is VAL1 * VAL2.
decorate(divNode(AST1, AST2), MIN, MOUT2, VAL)  :- 
decorate(AST1, MIN, MOUT1, VAL1), decorate(AST2, MOUT1, MOUT2,VAL2), VAL is VAL1 / VAL2.
decorate(storeNode(AST),MIN ,VAL ,VAL) :- decorate(AST, MIN, _, VAL).
decorate(negateNode(AST), MIN, MOUT, X)  :- decorate(AST, MIN, MOUT, VAL), X is -1 * VAL.
decorate(numNode(N), MIN, MIN, N).
decorate(recallNode, MIN, MIN, MIN).

calc :- readln(L,_, _, _, lowercase), preprocess(L, NL), e(Tree, NL, []), nl, print(Tree), 
decorate(Tree, 0, _, VAL), print('The answer is: '), print(VAL), nl.
