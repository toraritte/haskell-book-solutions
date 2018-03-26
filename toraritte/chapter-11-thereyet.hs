module Thereyet where

data ThereYet =
  There Float Int Bool
  deriving (Eq, Show)

-- "builder" pattern
nope :: Float -> Int -> Bool -> ThereYet
nope = There
-- nope 2.7 9 False -> ok

-- These function basically provide predefined
-- values at different levels.levels.
notYet :: Int -> Bool -> ThereYet
notYet = nope 25.5

notQuite :: Bool -> ThereYet
notQuite = notYet 10

yusssss :: ThereYet
yusssss = notQuite False
