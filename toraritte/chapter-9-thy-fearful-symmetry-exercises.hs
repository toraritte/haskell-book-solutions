module ThyFearfulSymmetry where

-------
-- 1 --
-------
myWords :: String -> [String]
myWords s = go s []
  where
    go str lst
     | str == "" = lst
     | take 1 str == " " =
         go (dropWhile (== ' ') str) lst
     | otherwise =
         let word   = takeWhile (/= ' ') str
             newStr = dropWhile (/= ' ') str
         in  go newStr (lst ++ [word])

-- *ThyFearfulSymmetry> myWords "valami ide szallt"
-- ["valami","ide","szallt"]

-- *ThyFearfulSymmetry> myWords "lofa"
-- ["lofa"]

-- *ThyFearfulSymmetry> myWords ""
-- []

-- *ThyFearfulSymmetry> ""
-- ""

-- *ThyFearfulSymmetry> myWords " ez elment      vadaszni"
-- ["ez","elment","vadaszni"]

-- *ThyFearfulSymmetry> myWords "     ejha  "
-- ["ejha"]

-------
-- 3 -- Skipping 2 to generalize `myWords`
-------
mySplit :: Char -> String -> [String]
mySplit sep s = go s []
  where
    go str lst
     | str == "" = lst
     | take 1 str == [sep] =
         go (dropWhile (== sep) str) lst
     | otherwise =
         let word   = takeWhile (/= sep) str
             newStr = dropWhile (/= sep) str
         in  go newStr (lst ++ [word])

