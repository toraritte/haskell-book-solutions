module MoreBottoms where

-- 1. take 1 $ map (+1) [undefined, 2, 3]
--
--    Same story as with list comprehensions: the function
--    is not immediately applied,  but `take 1` will force
--    out a  value, and  unfortunately the first  value is
--    `undefined`.

-- 2. take 1 $ map (+1) [1, undefined, 3]
--
--    Works, see 1.

-- 3. take 2 $ map (+1) [1, undefined, 3]
--
--    Bottoms out, see 1.

-- 4.
itIsMystery :: [Char] -> [Bool]
itIsMystery xs =
  map (\x -> elem x "aeiou") xs

-- 5.
-- map (^2) [1..10]
-- > [1,4,9, ..., 100]

-- map minimum [[1..10], [10..20], [20..30]]
-- > [1, 10, 20]

-- map sum [[1..5], [1..5], [1..5]]
-- > [15, 15, 15]

-- 6.
