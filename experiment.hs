module Main (main) where  -- no needed in the interpreter as it is the default in a module file


f :: Int -> [Int] -> [Int]
f 0 _ = []
f _ [] = []
f n args = do  
    f (n-1) args
    f n (tail args)

main :: IO() -- you can leave this out and the compiler will infer it
main = getContents >>=
    mapM_ print. (\(n:arr) -> f n arr). map read. words


    