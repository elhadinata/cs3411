% Elena Beatrice Hadinata
% z5159267
% COMP3411 Assignment 1


% QUESTION 1.1: List Processing
% sumsq_even(Numbers, Sum) 

% base case
sumsq_even([], 0).

% if number is odd,
% skip to next item
sumsq_even([N|Tail], Sum) :-
    1 is N mod 2,
    sumsq_even(Tail, Sum).

% if number is even,
% add to sum, do the same recursively for the subsequent elements
sumsq_even([N|Tail], Sum) :-
    0 is N mod 2,
    sumsq_even(Tail, TailSum),
    Sum is N * N + TailSum.
    

% QUESTION 1.2: List Processing
% log_table(NumberList,ResultList)

% base case
log_table([], []).

% for list with >= 1 element,
% find the log of each item N
% for each N return pair of [N, log(N)]
log_table([N|Tail], [[N, X]|TailResult]) :-
    X is log(N),
    log_table(Tail, TailResult).
    

% QUESTION 1.3: List Processing
% paruns(List,RunList)

% base cases
paruns([], []).

% for list with >= 1 element,
% return a parity list
% case when N is odd
paruns([N|Tail], [OddList|S]) :-
    1 is N mod 2,
   	odd([N|Tail], OddList, Rest),
   	paruns(Rest, S).

% case when N is even
paruns([N|Tail], [EvenList|S]) :-
    0 is N mod 2,
   	even([N|Tail], EvenList, Rest),
   	paruns(Rest, S).

odd([],[],[]).
odd([N|Tail], [], [N|Tail]) :-
   0 is N mod 2.
odd([N|Tail], [N|List], S) :-
   1 is N mod 2,
   odd(Tail, List, S).

even([],[],[]).
even([N|Tail], [], [N|Tail]) :-
   1 is N mod 2.
even([N|Tail], [N|List], Last) :-
   0 is N mod 2,
   even(Tail, List, Last).


% QUESTION 1.4: Prolog Terms
% eval(Expr, Val)
% Expr: add, sub, mul, div

% base cases for each expression
eval(add(A, B), C) :- 
    eval(A, AVal),
    eval(B, BVal),
    C is AVal + BVal.
eval(sub(A, B), C) :- 
    eval(A, AVal),
    eval(B, BVal),
    C is AVal - BVal.
eval(mul(A, B), C) :-
    eval(A, AVal),
    eval(B, BVal),
    C is AVal * BVal.
eval(div(A, B), C) :- 
    eval(A, AVal),
    eval(B, BVal),
    C is AVal / BVal.

% general case
eval(X, Val):- 
    Val is X.





