module MyEnumFromTo where

-- 2018 (?) First try (wow, did I overcomplicate things)
eft :: (Enum a, Ord a) => a -> a -> [a]
eft a b
  | a == b                      = [a]
  | (a < b) == False            = []
  | otherwise = go a b []
      where
        go from to lst
         | from == to = lst ++ [to]
         | otherwise  = go (succ from) to (lst ++ [from])

-- 2019/10/10 Somewhat simpler...:)
eft2 :: (Enum a, Ord a) => a -> a -> [a]
eft2 from to
  | from > to  = []
  | from == to = [to]
  | from < to  = from : (eft2 (succ from) to)

eftBool :: Bool -> Bool -> [Bool]
eftBool = eft

eftOrd :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> [Char]
eftChar = eft
