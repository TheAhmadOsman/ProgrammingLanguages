append([], L, L).
append([H|T], L, [H|M]) :- append(T, L, M).

rev([], []).
rev([H|T], M) :- rev(T, RT), append(RT, [H], M).

sublist(X, Y) :- length(X, XL), length(Y, YL), XL =< YL, append(_, X, Z), append(Z, _, Y).

% to run, run "swipl", and then "consult('prolog.pro')", and then "sublist([a, b, b,], [a, a, b, a, b])."

sublist([a, b, a], [a, a, b, a, b]).
sublist([a, b, a, b], [a, a, b, a, b]).
sublist([], [a, a, b, a, b]).

% Go back to page 193 and compare the append we have it here. What is different?
% Page 231: h@t error
% Page 283, and write a prolog reverse function

% try practice exercise 7.17.5, p. 302.