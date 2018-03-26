module FoldPractice where

-- `foldr` replaces the cons constructor with f, thus reducing the list.
-- The list ((:) 1 ((:) 2 ((:) 3 []       )))
-- becomes  ( f  1 ( f  2 ( f  3 base_case)))
--
-- foldr (+) 0 ((:) 1 ((:) 2 ((:) 3 [])))
-- equals      ((+) 1 ((+) 2 ((+) 3 0 )))

-- https://medium.com/scientific-breakthrough-of-the-afternoon/right-folding-examples-1e5774c3c513

lengthWithFoldr :: [a] -> Int
lengthWithFoldr xs = foldr (\_ x -> 1 + x) 0 xs

andWithFoldr :: [Bool] -> Bool
andWithFoldr bs = foldr (&&) True bs

orWithFoldr :: [Bool] -> Bool
orWithFoldr bs = foldr (||) False bs

anyWithFoldr :: (a -> Bool) -> [a] -> Bool
anyWithFoldr f xs = foldr (\a b -> f a || b) False xs

elemWithFoldr :: Eq a => a -> [a] -> Bool
elemWithFoldr x xs = foldr (\a b -> (a == x) || b) False xs
-- foldr :: (a -> b -> b) -> b -> [a] -> b
--           a = a (i.e., type of input list's constituent elements)
--                b = Bool (i.e., type of result)
--                           base case = False (or identity)

reverseWithFoldr :: [a] -> [a]
reverseWithFoldr xs = foldr (\a bs -> bs ++ [a]) [] xs
-- foldr :: (a -> b -> b) -> b -> [a] -> b
--           a = a
--                b = [a]
--                           base case = [] (or identity)

reverseWithFoldl :: [a] -> [a]
reverseWithFoldl xs = foldl (flip (:)) [] xs
-- reverseWithFoldl xs = foldl (\acc a -> a : acc) [] xs

concatWithFoldr :: [[a]] -> [a]
concatWithFoldr xs = foldr (++) [] xs

concatMapWithFoldr :: (a -> [b]) -> [a] -> [b]
concatMapWithFoldr f xs = foldr (\a bs -> f a ++ bs) [] xs
-- foldr :: (a -> b -> b) -> b -> [a] -> b
--           a = a of [a]
--                b = [b]
--                    (f a) will evaluate to [b] so that's perfect
--                           base case = [] (or identity)
