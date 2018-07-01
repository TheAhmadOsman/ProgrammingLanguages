% Ahmad M. Osman
% run prolog via terminal and enter "consult('ahmad-ch7ex.pro')." to call this file.
% Queries are commented after each exercise with answers.

parent(fred, sophusw). 
parent(fred, lawrence). 
parent(fred, kenny).
parent(fred, esther). 
parent(inger,sophusw).
parent(johnhs, fred). 
parent(mads,johnhs).
parent(lars, johan). 
parent(johan,sophus).
parent(lars,mads).
parent(sophusw,gary). 
parent(sophusw,john). 
parent(sophusw,bruce).
parent(gary, kent). 
parent(gary, stephen). 
parent(gary,anne). 
parent(john,michael). 
parent(john,michelle).
parent(addie,gary). 
parent(gerry, kent). 
male(gary). 
male(fred). 
male(sophus). 
male(lawrence).
male(kenny). 
male(johnhs).
male(mads). 
male(lars). 
male(john). 
male(bruce). 
male(johan). 
male(sophusw). 
male(kent). 
male(michael).
male(stephen). 
female(esther).
female(inger). 
female(anne). 
female(michelle). 
female(gerry). 
female(addie). 
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y), female(X).

% Exercise #1
sibling(X,Y):-parent(P,X),parent(P,Y), not(X=Y).
% sibiling(anne,stephen) results in true while sibiling(stephen,michael) results in false.

% Exercise #2
brother(X,Y):-sibling(X,Y),male(X).
% brother(sophusw,lawrence) is true while brother(sophusw,fred) is false.
/* brother(sophusw,X) reults in
    X = lawrence ;
    X = kenny ;
    X = esther ;
*/

% Exercise #3
niece(X,Y):-parent(P,X), sibling(Y,P), female(X).
/* niece(X,Y) results in:
    X = anne,
    Y = john ;
    X = anne,
    Y = bruce ;
    X = michelle,
    Y = gary ;
    X = michelle,
    Y = bruce ;
*/

% Exercise #4
cousin(X,Y):-parent(A,X),parent(B,Y),sibling(A,B).

% Exercise #5
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).

% Exercise #6
odd([_|T]):- even(T).
even([]).
even([_|T]):- odd(T).

% Exercise #7
palindrome([]).
palindrome([_]).
palindrome(LST):-append([H|T],[H],LST), palindrome(T).

% Exercise #8
/* append([H|T],Y,[H|L]):-append(T,Y,L).
append([],Y,Y).*/
sublist(X,Y):-append(_,X,L),append(L,_,Y).

% Exercise #9
factorial(0,1).
factorial(Num,F):- Num>0,  N1 is Num-1, factorial(N1,F1), F is Num*F1.

% Exercise #10
fibexp(0, 1) :- !.
fibexp(1, 1) :- !.
fibexp(N, R) :- N1 is N - 1,N2 is N - 2,fibexp(N1, R1),fibexp(N2, R2),R is R1 + R2.

% Exercise #11
fib(1,1,0).
fib(2,1,1).
fib(N,V,PrevF) :- N>2,N1 is N-1,fib(N1,PrevF,LastPrevF),V is PrevF + LastPrevF.

% Exercise #12
zipped([],[],[]).
zipped([A|TA],[B|TB],[Zipped|TZipped]) :- zipped(TA,TB,TZipped),Zipped = pair(A,B).

% Exercise #13
count(_,[],0).
count(X,[X|T],N) :- count(X,T,N1), N is N1+1.
count(X,[Y|T],N) :- not(X=Y), count(X,T,N).

% Exercise #14
len(0,[]).
len(L+1, [_|T]) :- len(L,T).

div(L,X) :- append(X,X,K),append(K,X,L).

threecopies([]).
threecopies(LST) :- div(LST,_).