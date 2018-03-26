module Quantum where

data Quantum = Yes
             | No
             | Both
             deriving (Eq, Show)

-- The 8 implementations: (because 3 -> 2 = 2^3)
convert1 :: Quantum -> Bool
convert1 Yes  = True
convert1 No   = False
convert1 Both = False

convert2 :: Quantum -> Bool
convert2 Yes  = False
convert2 No   = True
convert2 Both = False

convert3 :: Quantum -> Bool
convert3 Yes  = False
convert3 No   = False
convert3 Both = True

convert4 :: Quantum -> Bool
convert4 Yes  = True
convert4 No   = True
convert4 Both = False

convert5 :: Quantum -> Bool
convert5 Yes  = True
convert5 No   = False
convert5 Both = True

convert6 :: Quantum -> Bool
convert6 Yes  = False
convert6 No   = True
convert6 Both = True

convert7 :: Quantum -> Bool
convert7 Yes  = True
convert7 No   = True
convert7 Both = True

convert8 :: Quantum -> Bool
convert8 Yes  = False
convert8 No   = False
convert8 Both = False

