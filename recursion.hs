module Main (main) where  -- no needed in the interpreter as it is the default in a module file
import System.IO ()
import System.IO.Unsafe ()
import System.Environment ()
import Debug.Trace (trace)

-- fact :: Int -> Int -> Int
fact :: Int -> Int
fact 0 = 1
fact n = 
    let 
        callvalue = n
        result = n * fact (n - 1)
    in trace ("Input: " ++ show callvalue) result

main :: IO()
main = do
    n <- readLn :: IO Int
    print (fact n)
    print (fact (n-2))
    putStrLn "Hello!"