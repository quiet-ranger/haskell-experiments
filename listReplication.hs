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
f n args = do       -- the recursion in line 15 is fully executed before line 16 starts
    f (n-1) args    -- the final result is an empty list
    f n (tail args) -- the final result is also an empty list and presumably what is returned by the function
   
h :: Int -> [Int] -> [Int]
h 0 _ = []
h n args =
    head args : 

g :: Int -> [Int] -> [Int]
g x y = x:y



-- This part handles the Input and Output and can be used as it is. Do not modify this part.
main :: IO ()
main = getContents >>=
-- The following variant shows that all inputs are correctly passed to
-- the function being called
--    mapM_ print . (\(n:arr) -> g n arr) . map read . words
--
-- The following variant shows how important it is to include all values 
-- in a single line separated by a space.  The result is a list of tokens
--    mapM_ print . words
--
-- The following does not work for reasons explained above
--    mapM_ print . (\(n:arr) -> f n arr) . map read . words
--
