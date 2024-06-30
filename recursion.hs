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

-- Use first argument as a count of how many times the second element should be repeated in the resulting list
repeatElement :: Int -> Int -> [Int]
repeatElement 0 _ = []
repeatElement 1 x = [x]
repeatElement n x = x:repeatElement (n-1) x

repeatAllElements :: Int -> [Int] -> [Int]
repeatAllElements 0 _ = []
repeatAllElements _ [] = []
repeatAllElements n (h:t) = repeatElement n h ++ repeatAllElements n t 

solveProblem :: Int -> [Int] -> [Int]
solveProblem 0 _ = []
solveProblem _ [] = []
solveProblem n l = repeatAllElements n l



-- This part handles the Input and Output and can be used as it is. Do not modify this part.
main :: IO ()
main = getContents >>=
-- The following variant shows how important it is to include all values 
-- in a single line separated by a space.  The result is a list of tokens
--    mapM_ print . words
--
-- The following does not work for reasons explained above
--    mapM_ print . (\(n:arr) -> f n arr) . map read . words
--
-- A reasoned solution that shows in detail how everything works
   mapM_ print . (\(n:arr) -> solveProblem n arr) . map read . words

-- The one line solution for those who know very well the language and all functions available
--    mapM_ print . (\(n:arr) -> aceSolution n arr) . map read . words


-- Outline of the solution:
--    the input is already converted into a list of Int values
--    when your function is called, the head of that list is already passed separetely from the rest of the list
--    (replicate x) y  --> produces a list that contains x copies of y
--    concatMap m --> take every element of m, give it to (replicate x) and add the result to a final list with everything
aceSolution :: Int -> [Int] -> [Int]
aceSolution x = concatMap (replicate x)

