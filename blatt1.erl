-module(blatt1).
-export([
% Aufgabe 2
fib/1,
fib2/1,
fib3/1,
% Aufgabe 3
multiplyListElements/1,
multiplyListElements2/1,
%Aufgabe 4
doubleListElements/1,
doubleListElements2/1

]).

% Aufgabe 2: fibonacci zahlen Rechnung

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-2) + fib(N-1).

% andere moeglichkeit mit Guards

fib2(N) when N == 0 -> 0;
fib2(N) when N == 1 -> 1;
fib2(N) when N > 1 -> fib(N-1) + fib(N-2).

% andere Moeglichkeit mit Case 

fib3(N) -> 
    case N of 
         0 ->
            0;
         1 -> 
            1;
        _ -> 
            fib3(N-1) + fib3(N-2)
end.

%       Aufgabe3: Multiply lists Elements with each other

%  Erste Moeglichkeit

multiplyListElements([]) -> 1;
multiplyListElements([Head | Tail]) -> Head * multiplyListElements(Tail).

% zweite Moeglichkeit : durch Verwendung einer Hilfsfunktion
multiplyListElements2([]) -> list_empty;
multiplyListElements2(L) -> multiplyList(1, L).
multiplyList(X, []) -> X;
multiplyList(X, [Head | Tail]) -> multiplyList(X * Head, Tail).

%  Aufgabe 4: Hoehere Funktionen 

% definition der Map Function 
map(_, []) -> [];
map(F, [Head | Tail]) -> [F(Head) | map(F, Tail)].

%   moeglich loesung : map/2 Funktion des Lists Module kriegt eine funktionen als das erste Parameter und das betrifft eine Hoehere Order Funktionen 
    doubleListElements(L) -> lists:map(fun(X)-> 2 * X end, L).

%   moeglicheLoesung : genau wie das vorherige moeglichkeit aber hier kriegt map/2 eine pre-defined Funktion durch die Anwendung von das key-Word "fun" , bemerke das es braucht nur 
%                      das Key-word fun und den Namen der Funktion mit der Anzah ihrer parameter.
double(X) -> 2 * X.
doubleListElements2(L) -> map(fun double/1, L).

