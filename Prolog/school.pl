# swipl          % -> Spuštění rozhraní SWI-Prologu
# [soubor].      % -> Načtení souboru (modulu) do SWI-Prologu
# halt.          % -> Ukončení Prolog systému
# listing.       % -> Vypsání všech dynamicky definovaných predikátů
#-------------------------------------------------
# ","            % -> Konjunkce (AND) - odděluje cíle, které musí být splněny postupně
# ";"            % -> Disjunkce (OR) - nabízí alternativní cíle k vyzkoušení
# ":-"           % -> Implikace (IF ... THEN ...) - odděluje hlavu pravidla od těla
# "."            % -> Konec klauzule / pravidla / dotazu
# ":?-", "?"     % -> Způsob spuštění dotazu v některých systémech (v konzoli se obvykle nepíše)
# "()"           % -> Seskupení / Argumenty predikátu
# "!"            % -> Cut (Řez) - brání zpětnému prohledávání (backtracking) přes tento bod
# "\_"           % -> Anonymní proměnná - proměnná, jejíž hodnota nás nezajímá
# "[]"           % -> Prázdný seznam
# "|"            % -> Oddělovač seznamu: [Hlava | Telo]
# "\+"           % -> Negace selháním (NOT) - Uspěje, pokud cíl selže
#-------------------------------------------------
# is             % -> Aritmetické vyhodnocení: X is Y + Z - vypočítá výraz Y + Z a unifikuje s X
# "=", "=.."     % -> "=" Unifikace (shoda struktury); "=.." Operátor List-to-Term (Term =.. List)
# "+", "-", "*"  % -> Sčítání, odčítání, násobení (používá se s 'is')
# "/", "//"      % -> Dělení (Float) / Celočíselné dělení (Integer)
# "mod", "div"   % -> Zbytek po dělení (Modulo) / Celočíselné dělení (jako funkce)
# "**"           % -> Umocňování (exponentiation)
#-------------------------------------------------
# Aritmetické porovnávání (vyžaduje, aby termy byly předem vyhodnocené):
# "<", ">",      % -> Menší než, Větší než
# ">=", "=<"     % -> Větší nebo rovno, Menší nebo rovno
#-------------------------------------------------
# Porovnávání aritmetické hodnoty (predikáty ':=:', '=\\='):
# "=:= "         % -> Aritmeticky ekvivalentní: Vyhodnotí a porovná hodnoty
# "=\\="         % -> Aritmeticky neekvivalentní
#-------------------------------------------------
# "="            % -> Unifikace: Zkusí sjednotit dva termy (např. A = 5)
# "\="           % -> Neunifikovatelné: Uspěje, pokud termy nelze unifikovat
# "=="           % -> Termy jsou identické (Syntaktická shoda, bez ohledu na vazbu proměnných)
# "\=="          % -> Termy nejsou identické
#-------------------------------------------------
# % Aritmetické funkce (používá se s 'is'):
# "sin", "cos", "tan"    % -> Sinus, Kosinus, Tangens
# "asin", "acos", "atan" % -> Arkus sinus, kosinus, tangens
# "sqrt"                 % -> Druhá odmocnina (Square root)
#-------------------------------------------------
# % Řízení toku a testy:
# "fail", "false"        % -> Vždy selže, vynutí backtracking
# "true"                 % -> Vždy uspěje
# "repeat"               % -> Umožňuje neomezený backtracking / opakování
# "var", "nonvar"        % -> Testuje, zda je term volná / vázaná proměnná
# "number"               % -> Testuje, zda je term číslo
# "name"                 % -> Konverze Atom <-> Seznam ASCII kódů
#-------------------------------------------------
# % Dynamická manipulace s databází:
# "dynamic"                      % -> Deklaruje predikát jako dynamický (lze ho měnit za běhu)
# "assert", "asserta", "assertz" % -> Dynamicky přidá klauzuli (na konec / začátek / konec)
# "retract", "retractall"        % -> Dynamicky odstraní klauzuli (jednu / všechny)
# "abolish"                      % -> Odstraní celou definici predikátu
#-------------------------------------------------
# % Vstup/Výstup (I/O):
# "write"                % -> Vypíše term na výstup
# "read"                 % -> Přečte term ze vstupu
# "nl"                   % -> Nový řádek (Newline)

#-------------------------------------------------
% Fakta: jednotlivé číslice 0–9, slouží jako jednoduchá množina hodnot.
cislice(0).
cislice(1).
cislice(2).
cislice(3).
cislice(4).
cislice(5).
cislice(6).
cislice(7).
cislice(8).
cislice(9).
/* spusteni "[cv].", dotaz pak jen "cislice(co_chci)." */
/* konjunkce čárkou, disjunkce strednikem 
    cislice(A) hodi A = 0, mezernikem dalsi cislice(A), same taky cislice(A), cislice(B).
    implikace :- , \+ not, porovnani >= a =< , celociselne deleni // 
*/


/*
    Vyčísoelmí is
        A is V
        Jakoby přiřazení

    Aritmerické porovnání
        Porovnává hodnoty výrazů =:=
        obě strany musí být vyčíslitelné
        t1 =:= t2
            splněno pokud se hodnoty t1 a t2 rovnají
        t1 =\= t2
            opak =:=
        A =:= 3.   -- chyba, která zastaví program

    ==
    Provnává jestli jsou dva termi na konci shodné
    t1 == t2
    t1 \== t2 opak

    A == A. True
    A == B. False
    A = B, A == B. True
    A == 1+2. False
    1+2 == 2+1. False 
*/

/* vypsat cislice > 5: cislice(A), A > 5. */

% Fakta o pohlaví osob – jednoduché označení, kdo je muž a kdo žena.
muz(franta). % disk N - rodina.pdf 
muz(jan).
muz(karel).
muz(josef).
muz(tomas).
muz(petr).
muz(jiri).
muz(hektor).

zena(jana).
zena(sarka).
zena(sylva).
zena(romana).
zena(petra).
zena(vera).
zena(michala).
zena(anna).
zena(iveta).
zena(julie).

% Fakta: rodice(Otec, Matka, Potomek).
% Říkají, jaké mají dítě daný otec a matka.
rodice(karel,jana,jan).
rodice(karel,jana, michala).

rodice(jan,sarka,franta).
rodice(jan,sarka,tomas).
rodice(franta, sylva, romana).
rodice(tomas, petra, vera).

rodice(josef, michala, iveta).
rodice(josef, michala, anna).
rodice(jiri, anna, hektor).
rodice(petr, iveta, julie).

% otec(Otec, Potomek) – Otec je otcem Potomka,
% pokud existuje fakt rodice(Otec, NejakaMatka, Potomek).
otec(Otec, Potomek) :-
    rodice(Otec, _, Potomek).

% pak lze treba otec(karel, Potomek)., otec(Otec, franta)., muz/zena(A).

% matka(Matka, Potomek) – Matka je matkou Potomka,
% pokud existuje fakt rodice(NejakyOtec, Matka, Potomek).
matka(Matka, Potomek) :-
    rodice(_, Matka, Potomek).

% rodic(Rodic, Potomek) – někdo je rodič, pokud je buď otec, nebo matka.
rodic(Rodic, Potomek) :-
    otec(Rodic, Potomek).
rodic(Rodic, Potomek) :-
    matka(Rodic, Potomek).

% syn(Syn, Rodic) – Syn je muž a zároveň je jeho rodičem daná osoba.
syn(Syn, Rodic) :-
    muz(Syn),
    rodic(Rodic,Syn).

% dcera(Dcera, Rodic) – Dcera je žena a zároveň je její rodičem daná osoba.
dcera(Dcera, Rodic) :-
    zena(Dcera),
    rodic(Rodic,Dcera).


% sourozenec(S1,S2) – S1 a S2 jsou sourozenci,
% pokud mají stejného otce i matku a nejsou to stejné osoby.
sourozenec(S1,S2):-
    rodice(O, M, S1),   % najdi rodiče O,M pro S1
    rodice(O, M, S2),   % najdi stejné rodiče O,M pro S2
    S1 \= S2.           % zakázat případ S1 == S2 (není sourozenec sám sebe)

% predek(Predek, Osoba) – Predek je předek Osoby.
% 1. klauzule: přímý rodič je předek.
predek(Predek, Osoba) :-
    rodic(Predek, Osoba).
% 2. klauzule: pokud je Rodic rodič Osoby a Predek je předek Rodice,
% pak je Predek také předek Osoby (rekurzivní definice).
predek(Predek, Osoba) :-
    rodic(Rodic, Osoba),
    predek(Predek, Rodic).

% potomek(Potomek, Osoba) – Potomek je potomek Osoby,
% pokud je Osoba jeho rodič (jednokroková definice „směrem dolů“).
potomek(Potomek, Osoba) :-
    rodic(Osoba, Potomek).

% osoba(A) – A je osoba, pokud je definovaná jako muž nebo jako žena.
osoba(A) :- muz(A); zena(A).

/*Výstup:*/
/*  Psaní write(ahoj).
mezera nl.

# A = Ahoj, write(A).
# Pokud se vypíše _3342, tak je chyba v kódu nejspíše.
# Vypsání velkého písmena aby nebyla proměnná:
# write('Ahoj').

# Vstup:
 Čtení read(A).
    A = hodnota.
*/

% vypis_predku/0 – interaktivně načte jméno a vypíše všechny předky osoby.
vypis_predku:-
    write('Zadej jmeno osoby: '), % výzva pro uživatele
    nl,
    read(Osoby),                  % načte jméno z klávesnice
    predek(Predek, Osoby),        % najde jednoho předka
    write('Predek: '), 
    write(Predek),                % vypíše jméno předka
    nl,
    fail.                         % vynutí hledání dalšího předka (backtracking)
% Druhá klauzule bez podmínky – zavolá se, až když už nejsou další předci.
vypis_predku.

% prumer/0 – načte dvě čísla a vypíše jejich aritmetický průměr.
prumer:-
    write('Zdej dvě čísla: '),
    nl,
    read(X),                      % první číslo
    read(Y),                      % druhé číslo
    Suma is X + Y,                % součet
    Prumer is Suma / 2,           % průměr
    write('Prumer je: '),
    write(Prumer),
    nl.
    
/*Faktorial*/
% faktorial(N,Faktorial) – vypočítá faktoriál čísla N do proměnné Faktorial.
% Bázový případ: faktorial(0,1).  0! = 1.
faktorial(0,1).
% Rekurzivní případ pro N > 0.
faktorial(N,Faktorial):-
    N > 0,                        % povoleno jen pro kladná N
    N1 is N - 1,                  % N1 = N-1
    faktorial(N1,F1),             % rekurzivní výpočet (N-1)!
    Faktorial is N * F1.          % N! = N * (N-1)!

/*Zadání podle trojuhelnik.pdf
součet A,B,C = součtu C,D,E = součtu E,F,A
za písmena se dosadí čísla 1-6, každé číslo jen jednou
*/
% cislo/1 – povolené hodnoty pro vrcholy trojúhelníku.
cislo(1).
cislo(2).
cislo(3).
cislo(4).
cislo(5).
cislo(6).

% trojuhelnik(A,B,C,D,E,F) – dosazuje čísla 1–6 do vrcholů tak,
% aby:
%  - žádná dvě písmena neměla stejné číslo,
%  - součet A+B+C byl stejný jako součet C+D+E a E+F+A.
trojuhelnik(A,B,C,D,E,F):-
    cislo(A),
    cislo(B),
    cislo(C),
    cislo(D),
    cislo(E),
    cislo(F),

    A \= B, A \= C, A \= D, A \= E, A \= F,

    B \= C, B \= D, B \= E, B \= F,

    C \= D, C \= E, C \= F,

    D \= E, D \= F,

    E \= F,

    A + B + C =:= A + F + E,
    A + B + C =:= D + E + C.
 

/*Stejná úloha, ale vypsání všeho naráz*/
% vypis_trojuhelnik/0 – vygeneruje všechna řešení trojuhelnik/6 a vypíše je.
vypis_trojuhelnik:-
    trojuhelnik(A,B,C,D,E,F),   % vygeneruje jedno řešení
    write(A), write(' '),
    write(B), write(' '),
    write(C), write(' '),
    write(D), write(' '),
    write(E), write(' '),
    write(F), nl,
    fail.                       % vynutí hledání dalšího řešení
% Druhá klauzule bez podmínek uzavře predikát,
% když už nejsou další řešení trojuhelníku.
vypis_trojuhelnik.

/*Seznamy*/
/*
Zápis výčtem
    [1,2,3,4,5,ahoj,[1,2.2,[]]] = [HLAVA | TELO].
    [1,2,3] = [HLAVA | TELO].


*/
/*Zjištění prvního prvku v seznamu*/
% prvni(Prvni, Seznam) – sjednotí Prvni s prvním prvkem seznamu.
prvni(Prvni, [Prvni | _]).

% příklad: prvni(P,[1,2,3,4]). vrátí P = 1.

% Druhý prvek seznamu – přeskočí první a sjednotí Druhy s druhým.
druhy(Druhy, [_ , Druhy | _]).

% když se hledá prvek, který neexistuje, Prolog vrátí false

% Poslední prvek seznamu – bázový případ, seznam o jednom prvku.
posledni(Posledni, [Posledni]).
% Rekurzivně odřezává hlavu, dokud nezůstane poslední prvek.
posledni(Posledni, [_ | Telo]) :-   
    posledni(Posledni, Telo).

% Předposlení prvek seznamu – bázový případ, seznam o dvou prvcích.
predposledni(Predposledni,[Predposledni,_]).
% Jinak rekurzivně odřezává první prvek, dokud nezůstanou jen dva.
predposledni(Predposledni, [_|Telo]) :-
    predposledni(Predposledni, Telo).

% Extistuje daný prvek v seznamu?
% prvek(Prvek, Seznam) je pravdivé, pokud se Prvek někde v seznamu nachází.
prvek(Prvek, [Prvek | _]).
prvek(Prvek, [_ | Telo]) :-
    prvek(Prvek, Telo).

% Vypíše všechny prvky seznamu najednou – rekurzivně projde seznam.
vypis_seznam([]).
vypis_seznam([Hlava | Telo]):-
    write(Hlava),
    nl,
    vypis_seznam(Telo).

% Výpis odzadu seznamu – nejdřív vypíše tělo, pak hlavu (obrácené pořadí).
vypis_odzadu([]).
vypis_odzadu([Hlava | Telo]):-
    vypis_odzadu(Telo),
    nl,
    write(Hlava).

% Ntý prvek seznamu – pro N=1 vrátí hlavu, jinak snižuje N a jde do těla.
nty([Hlava | _], 1 , Hlava).
nty([_ | Telo], N, Prvek):-
    N > 1,
    N2 is N - 1,
    nty(Telo, N2, Prvek).

% Jsou v seznamu všechny prvky čísla kladná?
kladna([]).
kladna([Hlava | Telo]):-
    number(Hlava),   % prvek musí být číslo
    Hlava > 0,       % a musí být kladný
    kladna(Telo).

% Počet prvků v seznamu – rekurzivní počítání délky.
delka(0, []).
delka(Delka,[_|T]):-
    delka(D2,T),
    Delka is D2 + 1.

% Spočítat součet čísel v seznamu – skládá součet od konce.
soucet(0,[]).
soucet(Soucet,[H|T]):-
    soucet(S2,T),
    Soucet is S2 + H.

% spojit dva seznamy – přilepí S1 před S2.
spojeni([],S2,S2).
spojeni([H|T],S2,[H|S3]):-
    spojeni(T,S2,S3).

% smazani prvku ze seznamu – smaže první výskyt P.
smaz(_,[],[]).
% Pokud je hlava rovna P, výsledek je zbytek seznamu.
smaz(P,[P|S1],S1).
% Jinak hlavu zachová a smaže P ze zbytku.
smaz(P,[H1|S1],[H1|S2]):-
    P \= H1,
    smaz(P,S1,S2).

% smaz vsech vyskytu prvku ze seznamu – smaže všechny výskyty P.
smaz_vse(_,[],[]).
% Pokud je hlava rovna P, přeskočí ji a pokračuje dál.
smaz_vse(P,[P|S1],S2):-
    smaz_vse(P,S1,S2).
% Jinak hlavu nechá a smaže P jen ze zbytku.
smaz_vse(P,[H1|S1],[H1|S2]):-
    P \= H1,
    smaz_vse(P,S1,S2).

% smazání prvku ze seznamu – vytkni odstraní jeden výskyt P.
vytkni(P, [P|S1], S1).
vytkni(P, [H1|S1], [H1|S2]):-
    vytkni(P,S1,S2).

% Otočení seznamu
% otoc(S1,S2). – obrátí seznam S1 do S2 pomocí akumulátoru.
otoc(S1,S2):-
    otoc(S1,[],S2).
% otoc(S1, Akumulator, S2).
% Bázový případ – když už není co obracet, výsledek je akumulátor.
otoc([],A,A).
% Rekurzivně přesouvá hlavu H do akumulátoru.
otoc([H|T],A,S2):-
    otoc(T,[H|A],S2).


% slovo/0 – načte jedno slovo a ověří, že začíná a končí stejným znakem.
slovo:-
    write('zadej slovo: '),
    nl,
    read(Slovo),               % načte atom, např. ahoj.
    name(Slovo, Seznam),       % převede atom na seznam znaků (ASCII kódů)
    prvni(Znaky, Seznam),      % Znaky = první prvek seznamu
    posledni(Znaky, Seznam),   % Znaky = poslední prvek seznamu (stejná proměnná)
    write('zacina a koncí stejne'),
    nl.

% vir/0 – ukázka repeat/cut. „otravuje“, dokud nedostane přesně susenka.
vir:-
    repeat,                    % začátek smyčky
    write('Chci susenku!'),
    nl,
%   read(Odpoved),
%   Odpoved = susenka,
    read(susenka),             % uspěje jen pokud uživatel zadá susenka.
    !.                         % cut – ukončí repeat smyčku

% opakuj/0 – ptá se opakovaně na slovo, končí až po zadání "konec".
opakuj:-
    repeat,                    % nekonečná smyčka
    write('Zadej slovo: '),
    nl,
    read(Slovo),
    (Slovo = konec,!,          % pokud je slovo "konec", ukončí se (!)
    true
    ;
    write('Zadal jsi: '),      % jinak slovo vypíše
    write(Slovo),
    nl,
    fail                       % a fail vrátí řízení zpět k repeat
    ).


% Zápis faktů do databáze
% sestupne(N) – vytvoří fakta c(N), c(N-1), ..., c(1) v klesajícím pořadí (zapisuje na konec).
sestupne(0).
sestupne(N):-
    N > 0,
    assertz(c(N)),        % přidá fakt c(N) na konec databáze
    N1 is N - 1,
    sestupne(N1).         % rekurzivně pokračuje s N-1

% vzestupne(N) – vytvoří fakta c(N), c(N-1), ..., c(1), ale v obráceném pořadí (zapisuje na začátek).
vzestupne(0).
vzestupne(N):-
    N > 0,
    asserta(c(N)),        % přidá fakt c(N) na začátek databáze
    N1 is N - 1,
    vzestupne(N1).

% Spočítání faktů v databázi – kolik existuje faktů c/1.
pocet:-
    retractall(pocitadlo(_)), % smaže staré počitadlo (pokud existuje)
    asserta(pocitadlo(0)),    % nastaví počitadlo na 0
    c(_),                     % projde všechny fakty c(X) (přes backtracking)
    retract(pocitadlo(N)),    % vezme současnou hodnotu počitadla
    N2 is N + 1,              % inkrementuje o 1
    asserta(pocitadlo(N2)),   % uloží zpátky
    fail.                     % vynutí hledání dalšího faktu c(_)
% Druhá klauzule – po vyčerpání všech c(_) jen vypíše výsledek.
pocet:-
    pocitadlo(N),
    write('Pocet faktu c je: '),
    write(N),
    nl.