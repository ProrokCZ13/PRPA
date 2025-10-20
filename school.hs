--cvi3(2)

-- ghci => interaktivní prostředí
-- :l <soubor> => načtení scriptu
-- :r <soubor> => znovunačtení scriptu


soucetCtveru a b = (a ^ 2) + (b ^ 2)

jeMensi a b = a < b

mensi a b = if a < b || a == b then print a else print b

logickySoucet a b = if a > 0 then True else if b > 0 then True else False  


--vzory (patter matching)
ligickySoucet False False = False
ligickySoucet True _ = True
--ligickySoucin True False = True
--ligickySoucin True True = True


logickySoucin True True = True
logickySoucin _ _ = False

ligickySoucin a b = if a == True then if b == True then True else False else False


absoulutniHodnota x = if x < 0 then -x else x


-----------------------------------------------------------------------------------------------------------------
--cvi4(3)


faktorial n
    | n < 0 = error --faktorial ze zaporne hodnoty
    | n == 0 = 1
    | otherwise = n * faktorial (n-1)

zbytek a d
    | a < d = a
    | otherwise = zbytek (a - d) d 


--Seznam (najdu tam co hledám (zabte mě pls))
--Je to pole ale <slovo na R>

list1 = [1..100]
list2 = [100,99..1]


listonos = [x^2 | x<-[1..10]]

listonosisko = [(x,y,z) | x <- [1..4], y <- [1..4], z <- [1..4]]

listina = [x^2 | x <- [1..10], even x]

listx = [ x | x <- [1..1200600], rem 1200600 x == 0 ]


prvni (x:_) = x;
druhy (_:y:_) = y;

--byla uz nuda tak jsem daval nazvy songu

letTheBodiesHitFloor (_:x) = x

theLastOfTheRealOnes [x] = x
theLastOfTheRealOnes (_:xs) = theLastOfTheRealOnes xs

predposledni [y,_] = y
predposledni (_:ys) = predposledni ys
