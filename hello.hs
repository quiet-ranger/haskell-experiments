module Main (main) where  -- no needed in the interpreter as it is the default in a module file

main :: IO() -- you can leave this out and the compiler will infer it
main = do
    putStrLn "Hello, eveybody!"
    putStrLn ("Please look at my favourite numbers: " ++ show (filter odd [10..25]))

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

