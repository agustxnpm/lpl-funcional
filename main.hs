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


sinConsonantes = undefined

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
