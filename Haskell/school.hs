--cvi3(2)

-- ghci => interaktivní prostředí
-- :l <soubor> => načtení scriptu
-- :r <soubor> => znovunačtení scriptu


trojuhelnik a b c = if (a + b) > c && (a + c) > b && (b + c) > a then "Ano" else "Ne"

pythagoras a b = sqrt(a^2 + b^2)

soucetCtvercu a b = a^2 + b^2

jeMensi a b
    | a < b = "Splněno"
    | otherwise = "Nesplněno"

absolutni a
    | a < 0 = -a
    | otherwise = a

faktorial 0 = 1
faktorial n = n * faktorial (n-1)

{-faktorial n
    | n < 0 = error "Chyba"
    | n == 0 = 1
    | otherwise = n * faktorial (n-1)-}

nsd a 0 = a
nsd a b = nsd b (a `mod` b)

{-nsd a b
    | b == 0 = a
    | otherwise = nsd b (a `mod` b)-}

prvni [] = error "Prázdný seznam"
prvni (h:_) = h

druhy [] = error "prazdny"
druhy (_:h:_) = h

posledni [] = error "prazdny"
posledni [a] = a
posledni (h:t) = posledni t

predposledni [] = error "prazdny"
predposledni [_] = error "prazdny"
predposledni [a, _] = a
predposledni (h:t) = predposledni t

prvek _ [] = False
prvek a (x:s)
    | a == x = True
    | otherwise = prvek a s

nty _ [] = error "Nelze"
nty 1 (x:s) = x
nty n (x:s)
    | n < 0 = error "Nelze"
    | otherwise = nty (n-1) s

delkaPomocna n [] = n
delkaPomocna n (x:s) = delkaPomocna (n + 1) s

delka a = delkaPomocna 0 a

soucetPomocna n [] = n
soucetPomocna n (x:s) = soucetPomocna (n + x) s

soucet [] = 0
soucet a = soucetPomocna 0 a

nejmensiPrvekPomoc min [] = min
nejmensiPrvekPomoc min (x:s)
    | min > x = nejmensiPrvekPomoc x s
    | otherwise = nejmensiPrvekPomoc min s

nejmensi (x:s) = nejmensiPrvekPomoc x s

smazPrvni _ [] = []
smazPrvni a (x:s)
    | a == x = s
    | otherwise = x : smazPrvni a s

smazVsechny _ [] = []
smazVsechny a (x:s)
    | a == x = smazVsechny a s
    | otherwise = x : smazVsechny a s

otoc [] = []
otoc (x:s) = otoc s ++ [x]

scitaniSDvojkou a = (+2) a

umocniNa6 a = (^6) a

umocni6 a = 6^a

aplikujBinarniFunkci a b f = (f) a b

abf12 f = aplikujBinarniFunkci 1 2 f

zvys [] = []
zvys (x:s) = (x+1) : zvys s

aplikujNaPrvkySeznamu _ [] = []
aplikujNaPrvkySeznamu f (x:s) = (f x) : aplikujNaPrvkySeznamu f s

-- aplikujNaPrvkySeznamu abf12 [(+), (-), (*), (/)]  

-- zápočet discord
zdvojLiche [] = []
zdvojLiche (x:s)
    | x `mod` 2 == 0 = x : zdvojLiche s
    | otherwise = (2 * x) : zdvojLiche s