module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n =
  case n of
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    0 -> "zero"

digits :: Int -> [Int]
digits n = go n []
  where
    go num ds
     | num < 10 = [num] ++ ds
     | otherwise =
         let q = num `div` 10
             r = num `mod` 10
         in  go q ([r] ++ ds)

wordNumber :: Int -> String
wordNumber n =
  let toWords = map digitToWord (digits n)
  in  concat . intersperse  "-" $ toWords
