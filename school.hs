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

sign x = if x > 0 then 1 else if x == 0 then 0 if x < 0 then True else False

