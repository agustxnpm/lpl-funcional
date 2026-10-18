-- Suma dos números enteros.
-- Ej.: sumar 2 3 == 5
sumar :: Int -> Int -> Int
sumar x y = x + y

-- Suma los dos números enteros guardados en una tupla.
-- Ej.: sumarTupla (2, 3) == 5
sumarTupla :: (Int, Int) -> Int
sumarTupla (x, y) = x + y

-- Convierte una función de dos argumentos en una función que recibe una tupla.
-- Ej.: vuncurry sumar (2, 3) == 5
vuncurry f (x, y) = f x y

-- Convierte una función que recibe una tupla en una función de dos argumentos.
-- Ej.: vcurry sumarTupla 2 3 == 5
vcurry f x y = f (x,y)

-- Devuelve True si todos los booleanos de la lista son True.
-- Ej.: vand [True, True, False] == False
vand :: [Bool] -> Bool
vand [] = True
vand (x:xs) = x && vand xs

-- Devuelve True si al menos un booleano de la lista es True.
-- Ej.: vor [False, True, False] == True
vor :: [Bool] -> Bool
vor [] = False
vor (x:xs) = x || vor xs

-- Ignora el argumento recibido y siempre devuelve el mismo texto.
-- Ej.: ignoroArg1 42 == "no me importa"
ignoroArg1 x = "no me importa"


-- Conserva los elementos de la lista que cumplen el predicado.
-- Ej.: vfilter even [1, 2, 3, 4] == [2, 4]
vfilter :: (a -> Bool) -> [a] -> [a]
vfilter _ [] = []
vfilter p (x:xs)
  | p x       = x : vfilter p xs
  | otherwise = vfilter p xs

-- Indica si el elemento aparece en la lista.
-- Ej.: velem 'a' "casa" == True
velem :: Eq a => a -> [a] -> Bool
velem e lista = vany (\x -> e == x) lista

-- Indica si el carácter es una vocal, en mayúscula o minúscula.
-- Ej.: esVocal 'E' == True
esVocal c = velem c "aeiouAEIOU"

-- Devuelve únicamente las vocales de una cadena.
-- Ej.: soloVocales "hola mundo" == "oauo"
soloVocales [] = []
soloVocales (x:xs)
  | esVocal x = x : soloVocales xs
  | otherwise = soloVocales xs


-- Devuelve cada cadena de la lista conservando solo sus vocales.
-- Ej.: sinConsonantes ["hola", "mundo"] == ["oa", "uo"]
sinConsonantes [] = []
sinConsonantes (x:xs) = soloVocales x : sinConsonantes xs


-- Devuelve True si el año es divisible por 4 o por 100 y 400 a la vez.
-- Ej.: bisiesto 2024 == True; con la condición actual, bisiesto 1900 == True.
bisiesto :: Int -> Bool
bisiesto anio = mod anio 4 == 0 || mod anio 100 == 0 && mod anio 400 == 0

-- Genera los años desde el indicado y conserva los que bisiesto devuelve como True.
-- Ej.: take 3 (listaAnios 2024) == [2024, 2028, 2032]
listaAnios anio = filter bisiesto [anio..]


-- Cuenta los caracteres que no son vocales en una cadena.
-- Ej.: contarCantConsonantes "hola" == 2
contarCantConsonantes :: String -> Int
contarCantConsonantes [] = 0
contarCantConsonantes (x:xs) 
 | not (esVocal x) = 1 + contarCantConsonantes xs
 | otherwise = contarCantConsonantes xs


-- Cuenta cuántos caracteres no vocales hay en cada cadena de la lista.
-- Ej.: cantConsonantes ["hola", "aei"] == [2, 0]
cantConsonantes :: [String] -> [Int]
cantConsonantes [] = []
cantConsonantes (x:xs) = contarCantConsonantes x : cantConsonantes xs

-- Aplica la función recibida a la lista.
-- Ej.: h [1, 2, 3] sum == 6
h lista f = f lista 

-- Empareja elemento a elemento dos listas hasta que una se termina.
-- Ej.: vzip [1, 2] ['a', 'b', 'c'] == [(1, 'a'), (2, 'b')]
vzip [] _ = []
vzip _ [] = []
vzip (x:xs) (z:zs) = (x,z) : vzip xs zs

-- Separa una lista de pares en dos listas.
-- Ej.: vunzip [(1, 'a'), (2, 'b')] == ([1, 2], "ab")
vunzip [] = ([],[])
vunzip ((x,y): xs) = 
  let (lista1, lista2) = vunzip xs
  in (x : lista1, y : lista2)

-- Combina elementos correspondientes de dos listas usando la función recibida.
-- Ej.: vzipWith (+) [1, 2] [10, 20, 30] == [11, 22]
vzipWith _ [] [] = []
vzipWith _ _ [] = []
vzipWith _ [] _ = []
vzipWith f (x:xs) (y:ys) = f x y : vzipWith f xs ys

-- Toma del inicio los elementos consecutivos que cumplen la condición.
-- Ej.: vtakeWhile (< 3) [1, 2, 3, 1] == [1, 2]
vtakeWhile _ [] = []
vtakeWhile f (x:xs)
  | f x = x : vtakeWhile f xs
  | otherwise = []

-- Descarta del inicio los elementos consecutivos que cumplen la condición.
-- Ej.: vdropWhile (< 3) [1, 2, 3, 1] == [3, 1]
vdropWhile _ [] = []
vdropWhile f (x:xs) 
 | f x = vdropWhile f xs
 | otherwise = x : vdropWhile f xs 

-- Divide la lista en el prefijo que cumple la condición y el resto.
-- Ej.: vspan (< 3) [1, 2, 3, 1] == ([1, 2], [3, 1])
vspan f xs = (vtakeWhile f xs, vdropWhile f xs)


-- Indica si algún elemento de la lista cumple la condición.
-- Ej.: vany even [1, 3, 4] == True
vany _ [] = False
vany f (x:xs)
 | not (f x) = vany f xs
 | otherwise = True

-- Indica si todos los elementos de la lista cumplen la condición.
-- Ej.: vall even [2, 4, 6] == True
vall _ [] = True
vall f (x:xs)
 | f x = vall f xs
 | otherwise = False


-- Genera una lista infinita aplicando repetidamente la función al valor inicial.
-- Ej.: take 4 (viterate (+ 1) 0) == [0, 1, 2, 3]
viterate f x =  x : viterate f (f x)

-- Aplica repetidamente la función hasta que el valor cumple la condición.
-- Ej.: vuntil (>= 10) (+ 2) 0 == 10
vuntil condicion f x
  | condicion x = x
  | otherwise = vuntil condicion f (f x)


-- Devuelve el último elemento de una lista no vacía.
-- Ej.: vlast [1, 2, 3] == 3
vlast [] = error("la lista no contiene elementos")
vlast [x] = x
vlast (x:xs) = vlast xs

-- Devuelve el primer elemento de una lista no vacía.
-- Ej.: vhead [1, 2, 3] == 1
vhead [] = error("la lista no contiene elementos")
vhead (x:xs) = x

-- Devuelve todos los elementos de una lista excepto el primero.
-- Ej.: vtail [1, 2, 3] == [2, 3]
vtail [] = error("la lista no contiene elementos")
vtail [x] = []
vtail (x:xs) = xs

-- Devuelve todos los elementos de una lista excepto el último.
-- Ej.: vinit [1, 2, 3] == [1, 2]
vinit [] = error ("la lista no contiene elementos")
vinit [x] = []
vinit (x:xs) = x : vinit xs

-- Intenta mover el primer elemento al final; 
-- Ej. esperado: izquierda "hola" == "olah"; 
izquierda palabra = vtail palabra ++ [vhead palabra]

derecha palabra = [vlast palabra] ++ vinit palabra

desplaza f x palabra 
 | x == 0 = palabra
 |otherwise = desplaza f (x-1) (f palabra)