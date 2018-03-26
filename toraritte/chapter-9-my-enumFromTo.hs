module MyEnumFromTo where

eftBool :: Bool -> Bool -> [Bool]
eftBool a b =
  case a == True of
    True  -> [True, False]
    False -> [False, True]

-- All of the eft* functions would eventually look the
-- same as they all have instances of Enum and Ord,
-- therefore:
eft :: (Enum a, Ord a) => a -> a -> [a]
eft a b
  | a == b                      = [a]
  | (a < b) == False            = []
  | otherwise = go a b []
      where
        go from to lst
         | from == to = lst ++ [to]
         | otherwise  = go (succ from) to (lst ++ [from])

eftOrd :: Ordering
       -> Ordering
       -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> [Char]
eftChar = eft
