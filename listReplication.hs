module Main (main) where
import System.IO ()
import System.IO.Unsafe ()
import System.Environment ()
import Debug.Trace (trace)
import Data.Char (chr)

printList :: Show a => [a] -> [a]
printList = map (\x -> trace (show x) x)

f :: Int -> [Int] -> [Int]
f 0 _ = []
f _ [] = []
f n args =
    let
   -- print  (show (head args))
        result = f (n - 1) (printList args)
--        o = printList args
    in trace ("Input:" ++ show n) result
--    f n (tail args)

g :: a -> [b] -> [a]
g x y = [x]


-- This part handles the Input and Output and can be used as it is. Do not modify this part.
main :: IO ()
main = getContents >>=
    mapM_ print . (\(n:arr) -> g n arr) . map read . words
