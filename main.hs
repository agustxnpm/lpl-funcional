sumar :: Int -> Int -> Int

sumar x y = x + y

sumarTupla :: (Int, Int) -> Int
sumarTupla (x, y) = x + y


vuncurry f (x, y) = f x y

vcurry f x y = f (x,y)

vand :: [Bool] -> Bool
vand [] = True
vand (x:xs) = x && vand xs

vor :: [Bool] -> Bool
vor [] = False
vor (x:xs) = x || vor xs

ignoroArg1 x = "no me importa"



vfilter :: (a -> Bool) -> [a] -> [a]
vfilter _ [] = []
vfilter p (x:xs)
  | p x       = x : vfilter p xs
  | otherwise = vfilter p xs

velem :: Eq a => a -> [a] -> Bool
velem e lista = vany (\x -> e == x) lista

esVocal c = velem c "aeiouAEIOU"

soloVocales [] = []
soloVocales (x:xs)
  | esVocal x = x : soloVocales xs
  | otherwise = soloVocales xs



sinConsonantes [] = []
sinConsonantes (x:xs) = soloVocales x : sinConsonantes xs


bisiesto :: Int -> Bool
bisiesto anio = mod anio 4 == 0 || mod anio 100 == 0 && mod anio 400 == 0

listaAnios anio = filter bisiesto [anio..]


contarCantConsonantes :: String -> Int
contarCantConsonantes [] = 0
contarCantConsonantes (x:xs) 
 | not (esVocal x) = 1 + contarCantConsonantes xs
 | otherwise = contarCantConsonantes xs


cantConsonantes :: [String] -> [Int]
cantConsonantes [] = []
cantConsonantes (x:xs) = contarCantConsonantes x : cantConsonantes xs

h lista f = f lista 

vzip [] _ = []
vzip _ [] = []
vzip (x:xs) (z:zs) = (x,z) : vzip xs zs

vunzip [] = ([],[])
vunzip ((x,y): xs) = 
  let (lista1, lista2) = vunzip xs
  in (x : lista1, y : lista2)

vzipWith _ [] [] = []
vzipWith _ _ [] = []
vzipWith _ [] _ = []
vzipWith f (x:xs) (y:ys) = f x y : vzipWith f xs ys

vtakeWhile _ [] = []
vtakeWhile f (x:xs)
  | f x = x : vtakeWhile f xs
  | otherwise = []

vdropWhile _ [] = []
vdropWhile f (x:xs) 
 | f x = vdropWhile f xs
 | otherwise = x : vdropWhile f xs 

vspan f xs = (vtakeWhile f xs, vdropWhile f xs)



vany _ [] = False
vany f (x:xs)
 | not (f x) = vany f xs
 | otherwise = True

vall _ [] = True
vall f (x:xs)
 | f x = vall f xs
 | otherwise = False


