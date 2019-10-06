module Chapter5 where

-- Use  Hoogle or  Stackage  to find  function by  type
-- signature.
-- https://stackoverflow.com/questions/58260885

-- 1.
i :: a -> a
i a = a
-- i = id

-- 2.
c :: a -> b -> a
c a b = a
-- c = const

-- 3.
c'' :: b -> a -> b
c'' a b = a
-- c'' = const

-- 4.
c' :: a -> b -> b
c' a b = b
-- c'' = seq

-- 5.
r :: [a] -> [a]
r = tail
-- r = reverse

-- 6.
co :: (b -> c) -> (a -> b) -> a -> c
co bToC atoB a = bToC (atoB a)
-- co bToC atoB a = bToC $ atoB a
-- co bToC atoB = bToC . atoB
-- co = (.)

-- 7. (alpha equivalent with 4.)
a :: (a -> c) -> a -> a
a f a = a
-- a _ = a
-- a = seq

-- 8.
a` :: (a -> b) -> a -> b
a` f a = f a
-- a` = ($)
