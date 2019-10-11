module Chapter8Recursion where

-- 2. sum numbers from 1 to n

sumN :: (Eq a, Num a) => a -> a
sumN n = go n 0
  where go n acc
         | n == 0 = acc
         | otherwise = go (n-1) (acc+n)

sumN2 :: (Eq a, Num a) => a -> a
sumN2 n = go n 0
  where
    go 0 acc = acc
    go n acc = go (n-1) (acc+n)

-- 3. multiplication using recursive summation
mult :: (Integral a) => a -> a -> a
mult 1 b = b
mult a b = b + (mult (a-1) b)

-- or with composition
mult2 :: (Integral a) => a -> a -> a
mult2 1 b = b
mult2 a b = (+b) . (mult (a-1)) $ b
