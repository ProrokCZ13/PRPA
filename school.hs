soucetCtveru a b = (a ^ 2) + (b ^ 2)

jeMensi a b = a < b

mensi a b = if a < b || a == b then print a else print b

logickySoucet a b = if a > 0 then True else if b > 0 then True else False  


--vzory (patter matching)
ligickySoucin False False = False
ligickySoucin False True = True
ligickySoucin True False = True
ligickySoucin True True = True









--This is 