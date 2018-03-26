module StandardFunctions where

-- 0
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs)
  | x == True = myAnd xs
  | otherwise = False

myAndV2 :: [Bool] -> Bool
myAndV2 [] = True
myAndV2 (x:xs) = x && myAndV2(xs)

-- 1
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

-- 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny pred (x:xs) = pred x || myAny pred xs

-- 3
---- Without any
elemWithoutAny :: Eq a =>  a -> [a] -> Bool
elemWithoutAny _ [] = False
elemWithoutAny elem (x:xs)
  | elem == x = True
  | otherwise = elemWithoutAny elem xs

elemWithoutAny2 :: Eq a =>  a -> [a] -> Bool
elemWithoutAny2 _ [] = False
elemWithoutAny2 elem (x:xs) =
  (elem == x) || elemWithoutAny2 elem xs

-- With any
elemWithAny :: Eq a => a -> [a] -> Bool
elemWithAny elem xs = any (\x -> elem == x) xs

-- 4
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- 5
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

-- 6
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7
squishAgain :: [[a]] -> [a]
squishAgain xss = squishMap id xss

-- 8
myMaxBy :: (a -> a -> Ordering) -> [a] -> a
myMaxBy f (x:xs) = go f xs x
  where
    go _ [] max = max
    go f (a:as) max
     | f a max == GT = go f as a
     | otherwise     = go f as max

-- 9
myMinBy :: (a -> a -> Ordering) -> [a] -> a
myMinBy f (x:xs) = go f xs x
  where
    go _ [] min = min
    go f (a:as) min
     | f a min == GT = go f as min
     | otherwise     = go f as a

-- 10
myMin :: (Ord a) => [a] -> a
myMin xs = myMinBy compare xs

myMax :: Ord a =>   [a] -> a
myMax xs = myMaxBy compare xs
