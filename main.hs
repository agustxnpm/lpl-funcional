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
velem _ [] = False
velem e (x:xs)
  | e == x    = True
  | otherwise = velem e xs

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

