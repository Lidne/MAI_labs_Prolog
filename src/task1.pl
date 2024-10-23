my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1 + 1.

my_member(X, [X|_]).
my_member(X, [_|T]) :- my_member(X, T).

my_append([], L, L).
my_append([H|T], L, [H|R]) :- my_append(T, L, R).

my_remove(_, [], []).
my_remove(X, [X|T], R) :- my_remove(X, T, R).
my_remove(X, [H|T], [H|R]) :- my_remove(X, T, R).

my_permute([], []).
my_permute(L, [X|P]) :- my_remove(X, L, R), my_permute(R, P).

my_sublist([], _).
my_sublist([H|T], [H|R]) :- my_sublist(T, R).
my_sublist(L, [_|R]) :- my_sublist(L, R).

delete_all(_, [], []).
delete_all(X, [X|T], R) :- delete_all(X, T, R).
delete_all(X, [H|T], [H|R]) :- delete_all(X, T, R).

merge([], L, L).
merge(L, [], L).
merge([H1|T1], [H2|T2], [H1|R]) :- H1 =< H2, merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]) :- H1 > H2, merge([H1|T1], T2, R).

example(X, Y, Z) :-
    delete_all(3, X, X1),
    merge(X1, Y, Z).
