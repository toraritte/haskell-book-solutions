module OwnIterateAndUnfoldr where

-- 1. Write the function myIterate using direct recursion. Com-
-- pare the behavior with the built-in iterate to gauge cor-
-- rectness. Do not look at the source or any examples of
-- iterate so that you are forced to do this yourself.
---------------------------------------------------------------
myIterate :: (a -> a) -> a -> [a]
myIterate f a = [f a] ++ (myIterate f (f a))

-- 2. Write the function myUnfoldr using direct recursion. Com-
-- pare with the built-in unfoldr to check your implementa-
-- tion. Again, don’t look at implementations of unfoldr so
-- that you figure it out yourself.
---------------------------------------------------------------

-- This helped me figure it out:
--
-- f = unfoldr go 0
--   where
--     go 7 = Nothing
--     go b = Just (b, b+1)

myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b =
  case (f b) of
    Nothing    -> []
    Just (a,b) -> a : (myUnfoldr f b)

-- 3. Rewrite myIterate into betterIterate using myUnfoldr. A
-- hint — we used unfoldr to produce the same results as
-- iterate earlier. Do this with different functions and see if
-- you can abstract the structure out.
---------------------------------------------------------------
-- It helps to have the
-- types in front of you
-- myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]

betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\b -> Just (b, (f b)))

-- Remember, your betterIterate should have the same re-
-- sults as iterate.
-- Prelude> take 10 $ iterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]
-- Prelude> take 10 $ betterIterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]
