f :: Int -> [Int] -> [Int]
f 0 _ = 0
f _ [] = 0    
f n args = do 
    print  (show (head args))
    f (n - 1) (args)
    f n (tail args)
    
-- This part handles the Input and Output and can be used as it is. Do not modify this part.
main :: IO ()
main = getContents >>=
       mapM_ print. (\(n:arr) -> f n arr). map read. words
       