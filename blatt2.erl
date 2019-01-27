-module(blatt2).
-export([
aufgabe1/1,
% Aufgabe 2
wurzel/3,
wurzel/1,
wurzelc/3,
% Aufgabe 3 
inverse/1,
altInverse/1,
% Aufgabe 4
listTest/1,
listAdd/1,
listAdd2/1,
listRemove/1
]).

%  Aufgabe 1

aufgabe1(N) when N > 0 -> 
    case (N) of 
        1 -> 
            ([[]] ++ 42 == 42);
        2 -> 
            ([[]] ++ 42 == [42]);
            
        3 -> 
            ([[]] ++ 42 == [[], 42]);
           
        4 -> 
            ([[]] ++ [42] == [[], 42]);
            
        5 -> 
            ([42] ++ [] == [42]);
           
        6 -> ([42] ++ [42] == [42, 42])
end.

% Aufgabe 2 : Newtonsche Wurzeliteration 
%   2.a
square(X) -> X * X. 

wurzel(X, Y, Epsilon) when X >= 0, Y >= 1 -> 
    case (abs(square(Y) - X) < Epsilon) of  % koennte auch die funktion math:pow/2 aus der math bilbliothek verwendet werden oder einfach Y*Y  schreiben
        true -> 
            Y;
        _ -> 
            wurzel(X, 0.5 *(Y + X/Y), Epsilon) % koennte auch false geschrieben werden 
end;

wurzel(_, 0, _) -> unaccepted_value.

%   2.b

wurzel(X) -> wurzel(X, 10, 0.001).

%   2.c

wurzelc(X, Y1, Y2) -> 
    case (abs((Y1 - Y2) < 0.001)) of 
        true -> 
            Y1;
        _ -> 
            wurzelc(X, 0.5 * (Y1 + X/Y1), Y1)
end.

% Aufgabe 3: Reziproke der Elemente einer Liste 

map(_, []) -> [];
map(F, [Head | Tail]) -> [F(Head) | map(F, Tail)].

reziproke(X) -> 
    case not(X == 0) of 
        true ->
            1/X;
        _ -> 
            fail  
end.

% 3.a
inverse(L) -> map(fun reziproke/1, L).
% 3.b
altInverse(L) -> [reziproke(X) || X <- L].

%  Aufgabe 4

%  4.a
listTest(PL) -> fun(PName) ->
    case (lists:member({name, PName}, PL)) of 
        true ->
            true;
        _ ->
            false
end
end.

%  4.b

listAdd(L) -> fun(PTuple) when is_tuple(PTuple) ->
     case (size(PTuple) == 2) of 
         true -> 
            L ++ [PTuple];
        _ ->
            not_addable
end
end.

% but I Actually see it this way 

listAdd2(L) -> fun(X) ->
    case is_list(X) of 
        true -> 
            case length(X) > 0 of 
                    true ->
                        L ++ [{name, X}];
                    _ ->
                        cant_add_an_empty_value_for_name
            end;
        _ ->
            not_addable
    end
 end. % or it can be even integrated in the listTest/1 in the case it's not found to be added 

%  4.c
listRemove([Head | Tail]) -> fun(PTuple) ->
    case (Head == PTuple) of
        true -> 
            [Tail];
        _ ->
            listRemove(Tail)
    end
end. 











