module AsPatterns where

import Data.Char

-- 1 ---
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf pattern word = filter (flip elem pattern) word == pattern

isSubseqOf2 :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf2 [] _ = True
isSubseqOf2 _ [] = False
isSubseqOf2 pattern@(x:xs) (y:ys)
  | x == y    = isSubseqOf2 xs ys
  | otherwise = isSubseqOf2 pattern ys

testIsSubseqOfs :: (String -> String -> Bool) -> [Bool]
testIsSubseqOfs f =
  [ f "blah" "blahwoot" == True
  , f "blah" "wootblah" == True
  , f "blah" "wboloath" == True
  , f "blah" "wootbla" == False
  , f "blah" "halbwoot" == False
  , f "blah" "blawhoot" == True
  ]

-- 2 ---
capitalizeWords :: String -> [(String, String)]
capitalizeWords sentence = map toCapitalWordTuple (words sentence)
  where
    toCapitalWordTuple word@(char:cs) = (word, (toUpper char) : cs)
