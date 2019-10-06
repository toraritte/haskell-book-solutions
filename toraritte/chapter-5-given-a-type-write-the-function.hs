module Chapter5 where

-- 6.
co :: (b -> c) -> (a -> b) -> a -> c
co bToC atoB a = bToC (atoB a)
-- co bToC atoB a = bToC $ atoB a
-- co bToC atoB = bToC . atoB
-- co = (.)
