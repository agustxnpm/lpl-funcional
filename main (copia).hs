
a = "Hola mundo"

f x = x*x*x*x*x*x

sisi x y = if x > y then x else y


g x = if x < 0 then x*(-1) else x

factorial 0 = 1
factorial x = x * factorial (x - 1)

factorial' x = if x == 0 then 1 else x * factorial' (x - 1) 

factorial'' x
    | x == 0 = 1
    | otherwise = x * factorial'' (x - 1)

fibo 0 = 0
fibo 1 = 1
fibo x = fibo (x -1 ) + fibo (x - 2)


fibo' x = 
    if x == 1 || x == 0 then x else fibo' (x-1) + fibo'(x-2)


fibo'' x
    | x == 0 = 0
    | x == 1 = 1
    | otherwise = fibo''(x-1) + fibo''(x-2)


vlen [] = 0
vlen (x:xs) = 1 + vlen xs


vmap _ [] = []
vmap f (x:xs) = (f x) : vmap f xs

vfilter _ [] = []
vfilter f (x:xs)
    | f x = x : (vfilter f xs)
    | otherwise = vfilter f xs


vfoldr _ x0 [] = x0
vfoldr f x0 (x:xs) = 
    f x (vfoldr f x0 xs)