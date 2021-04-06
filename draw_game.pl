draw_row([]) :-
    !,
    format('|~n').
draw_row([H|T]) :-
    var(H),
    !,
    format('|   '),
    draw_row(T).
draw_row([H|T]) :-
    format('| ~w ', [H]),
    draw_row(T).

draw_spacer(0) :-
    !,
    format('+~n').
draw_spacer(N) :-
    format(+---),
    M is N-1,
    draw_spacer(M).

take_row(List, 0, [], List) :-
    !.
take_row([H|T], N, [H|R], O) :-
    M is N-1,
    take_row(T, M, R, O).

draw_game(Board) :- length(Board, Len), Row is round(sqrt(Len)), draw_game(Board,Row).

draw_game([], N) :-
    draw_spacer(N),
    nl.
draw_game(Board, N) :-
    take_row(Board, N, Row, Rest),
    draw_spacer(N),
    draw_row(Row),
    draw_game(Rest, N).