module Lofa where

-- The datatype variable is constrained on use,
-- i.e. in the function below.
-- https://wiki.haskell.org/Data_declaration_with_constraint
data DividedResult a =
    Result (a,a)
  | DividedByZero
  deriving (Show)

-- quotient (Q) is negative when +/- or -/+
-- remainder (R) is negative when (denominator < 0)

--   when (Q < 0) the the formula is
--   |num| - |denum| until first negative result
--   and the signums for Q and R are set to the
--   rules according to the above

divBy :: Integral a => a -> a -> DividedResult a
divBy num denom =
  case (denom == 0) of
    True  ->
      DividedByZero
    False ->
      Result (go nt dt 0)
    where
      nt = ( abs(num), signum(num) )
      dt = ( abs(denom), signum(denom) )
      go (an, sn) (ad, sd) q
       | (sn*sd) == (-1) && an < ad =
           -- divMod 25 (-2) = (-13,-1)
           -- divMod (-25) 2 = (-13, 1)
           -- hence multiply with the signum of the
           -- numerator
           ( (q+1)*(-1), (an-ad)*sn )
       | an < ad =
           (q, an*sd)
       | otherwise = go ((an-ad),sn) dt (q+1)

-- TEST
-- pp = (10,3)
-- pm = (10, (-3))
-- mp = ((-10),3)
-- mm = ((-10),(-3))

-- divTest :: Integral a => (a, a) -> Bool
-- divTest t = (uncurry divBy t) == (uncurry divMod t)
