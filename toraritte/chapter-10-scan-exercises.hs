module Fibs where

fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs

--- 1 ---------------------------------------------
fibs20 :: [Integer]
fibs20 = take 20 fibs

--- 2 ---------------------------------------------
fibsLessThan100 :: [Integer]
fibsLessThan100 = takeWhile (<100) fibs

--- 3 ---------------------------------------------
facs :: Num a => a
facs = scanl (*) 1 [2..]

-- take 20 $ scanl (\b a -> b ++ "*" ++ show a) "1" [2..]
