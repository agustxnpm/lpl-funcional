
main :: IO ()
main = do
    putStrLn "Como te llamas?"
    nombre <- getLine
    putStrLn ("Hola, " ++ nombre)