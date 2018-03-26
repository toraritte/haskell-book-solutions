module Chapter10Exercises where

--- 1 ---------------------------------------------
 -- a ---
svs :: [(Char, Char, Char)]
svs = [(s1,v,s2) | s1 <- stops, v <- vowels, s2 <- stops]
  where
    stops = "pbtdkg"
    vowels = "aeiou"

 -- b ---
svsP :: [(Char, Char, Char)]
svsP = filter startWithP svs
  where
    startWithP ('p', _, _) = True
    startWithP _           = False

 -- c ---
type Nouns = [String]
type Verbs = [String]

nvn :: Nouns -> Verbs ->  [(String, String, String)]
nvn nouns verbs = [(n1,v,n2) | n1 <- nouns, v <- verbs, n2 <- nouns]

--- 3 ---------------------------------------------
seekritFunc x = (fromIntegral (sum (map length (words x)))) / (fromIntegral (length (words x)))

--- 4 ---------------------------------------------
 -- 1 ---
myOr :: [Bool] -> Bool
myOr = foldr (||) False

 -- 2 ---
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = myOr . map f

 -- 3 ---
myElemV1 :: Eq a => a -> [a] -> Bool
myElemV1 e = foldr (\ a b -> (a == e) || b) False

myElemV2 :: Eq a => a -> [a] -> Bool
myElemV2 e = any (== e)

 -- 4 ---
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

 -- 5 ---
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\a b -> (f a) : b) []

 -- 6 ---
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr decide []
  where
    decide a b = case (f a) of
      True  -> a : b
      False -> b

 -- 7 ---
squish :: [[a]] -> [a]
squish = foldr (++) []

 -- 8 ---
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\a b -> (f a) ++ b) []

squishMapV2 :: (a -> [b]) -> [a] -> [b]
squishMapV2 f = squish . map f

  -- For example:
  -- squishMap (\(a,b,c) -> [a,b,c]) svs

 -- 9 ---
squishAgain :: [[a]] -> [a]
squishAgain = squishMap (++ [])

-- 10 ---   !!!
-- I couldn't get it to work with `foldr` because of
-- its laziness.
--
-- It just occured to me, writing out the evaluation steps of foldl
-- and foldr, that this exercise has been probably engineered to use foldl
-- explicitly, because the special cases above would naturally yield those
-- results. (For example, for myMaximumBy (\_ _ -> GT) [1..10] it is (1 f 2)
-- f 3 etc. would always yield the first argument, which is 1.)
--
-- A question:
-- https://codereview.stackexchange.com/questions/189885/maximumby-using-foldr-that-satisfies-special-cases-with-gt-and
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = foldl doF x xs
  where
    doF a b
     | f a b == GT = a
     | otherwise   = b

myMaximumByV2 :: (a -> a -> Ordering) -> [a] -> a
myMaximumByV2 = foldr dof 0
  where
    dof a b
     | f a b == GT = a + b
     | otherwise   = b + b
-- 11 ---
-- along the same lines as 10
