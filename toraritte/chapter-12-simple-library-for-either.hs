module SimpleLibraryForEither where

-- 1. Try to eventually arrive at a solution that uses foldr, even
-- if earlier versions don’t use foldr.
------------------------------------------------------------------
lefts' :: [Either a b] -> [a]
lefts' = foldr getLeft []
  where
    getLeft (Left a) b = a : b
    getLeft _ b        = b

-- 2. Same as the last one. Use foldr eventually.
-------------------------------------------------
rights' :: [Either a b] -> [b]
rights' = foldr getRight []
  where
    getRight (Right a) b = a : b
    getRight _ b        = b

-- 3 ---
--------
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = go [] []
  where
    go left right [] = (reverse(left), reverse(right))
    go left right ((Left a):xs)  = go (a:left) right xs
    go left right ((Right b):xs) = go left (b:right) xs

-- 4 ---
--------
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _)  = Nothing
eitherMaybe' f (Right a) = Just (f a)

-- 5. This is a general catamorphism for Either values.
-------------------------------------------------------
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a)  = f a
either' _ g (Right b) = g b

-- 6. Same as before, but use the either' function you just
-- wrote.
-----------------------------------------------------------
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' _ (Left _) = Nothing
eitherMaybe'' f e = Just (either' undefined f e)
