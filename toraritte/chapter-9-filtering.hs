module Filtering where

-- 1. Given the above, how might we write a filter function that would give us all the multiples of 3 out of a list from 1-30?

multiplesOfThree1 :: Integral a => [a] -> [a]
multiplesOfThree1 lst = [x | x <- lst, x `mod` 3 == 0 ]

multiplesOfThree2 :: Integral a => [a] -> [a]
multiplesOfThree2 = filter multiplesOf3
  where
    multiplesOf3 = ((== 0) . (flip mod 3))

-- 2. Recalling what we learned about function composition, how could we compose the above function with the length function to tell us *how many* multiples of 3 there are between 1 and 30?

howManyMultiplesOf3 :: Integral a => [a] -> Int
howManyMultiplesOf3 = length . multiplesOfThree2

-- 3. Next we’re going to work on removing all articles (’the’, ’a’, and ’an’) from sentences. You want to get to something that works like this:

-- Prelude> myFilter "the brown dog was a goof"
-- ["brown","dog","was","goof"]

removeArticles1 :: String -> [String]
removeArticles1 str =
  [s | s <- words str, (not $ elem s ["the", "a"])]

removeArticles2 :: String -> [String]
removeArticles2 str = filter ifArticle (words str)
  where
    ifArticle = not . (flip elem ["the", "a"])

