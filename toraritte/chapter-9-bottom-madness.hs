module BottomMadness where

-- 1. Only  returns  bottom  in  ghci,  because  the  repl
--    forces  the  entire  list.  Just  like  with  `map`,
--    list  comprehensions  do   not  apply  the  function
--    immediately. Only  the values that are  "forced" out
--    of  the  resulting  list will  have  the  associated
--    functions applied.
--
-- > Prelude> [x^y | x <- [1..5], y <- [2, undefined]]
-- >
-- > [1,*** Exception: Prelude.undefined
-- > CallStack (from HasCallStack):
-- >   error, called at libraries/base/GHC/Err.hs:78:14 in base:GHC.Err
-- >   undefined, called at <interactive>:1:30 in interactive:Ghci1
-- >
-- > Prelude> a = [x^y | x <- [1..5], y <- [2, undefined]]
-- >
-- > Prelude> take 1 a
-- > [1]
-- >
-- > Prelude> take 2 a
-- > [1,*** Exception: Prelude.undefined
-- > CallStack (from HasCallStack):
-- >   error, called at libraries/base/GHC/Err.hs:78:14 in base:GHC.Err
-- >   undefined, called at <interactive>:2:34 in interactive:Ghci1

-- 2. Proves the point above.

-- 3. sum [1, undefined, 3]
--
--    Throws because sum operates on the values, therefore
--    forcing them to be evaluated.

-- 4. length [1, 2, undefined]
--
--    Only operates on the spine, thus won't throw.

-- 5. length $ [1, 2, 3] ++ undefined
--
--    Throws because `undefined` is part of the spine.

-- 6. take 1 $ filter even [1, 2, 3, undefined]
--
--    Won't throw because `filter` is similar to `map` and
--    list comprehensions.

-- 7. take 1 $ filter even [1, 3, undefined]
--
--    Throws because `filter` is  forced to go through the
--    entire list, as there isn't  at least one value that
--    would satisfy the predicate.

-- 8.  take 1 $ filter odd [1, 3, undefined]
-- 9.  take 2 $ filter odd [1, 3, undefined]
-- 10. take 3 $ filter odd [1, 3, undefined]
--
--     Only  10  will  throw,  because  there  are  only  2
--     values in the resulting  list that would satisfy the
--     predicate.
