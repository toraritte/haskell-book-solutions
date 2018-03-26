module LogicGoats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 27

-- 1 ---
newtype IntStringTuple = IST (Int, String)

instance TooMany IntStringTuple where
  tooMany (IST (i,_)) = tooMany i

-- 2 ---
newtype IntIntTuple = IIT (Int, Int)

instance TooMany IntIntTuple where
  tooMany (IIT (i,j)) = tooMany (i+j)

-- 3 ---
-- https://stackoverflow.com/questions/3944756/best-way-to-implement-ad-hoc-polymorphism-in-haskell
-- https://stackoverflow.com/questions/3945112/polymorphic-class-constrained-instances
newtype NumTooMany a = NTM (a, a) deriving (Show)

instance (Num a, TooMany a) => TooMany (NumTooMany a) where
  tooMany (NTM (a,b)) = tooMany (a*b)

  -- tooMany (NTM (2::Int, 3::Int))

  -- f :: NumTooMany a -> (a, a)
  -- f (NTM x) = x
