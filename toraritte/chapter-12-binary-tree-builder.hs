module BinTreeUnfoldr where

data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord)

instance (Num a, Eq a, Show a) => Show (BinaryTree a) where
  show Leaf = "Leaf"
  show (Node Leaf a Leaf)  = "Node Leaf " ++ (show a) ++ " Leaf"
  show (Node left a right) =
       "Node (" ++ (show left) ++ ")"
    ++ "\n" ++ (padding $ a+1) ++ (show a)
    ++ "\n" ++ (padding $ a+1) ++ "(" ++ (show right) ++ ")"

-- padding :: Integer ->  String
padding 1 = "     "
padding n = "      " ++ (padding $ n-1)


-- 1. Write unfold for BinaryTree.
----------------------------------
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold f a =
  case (f a) of
    Nothing ->
      Leaf
    Just (t, u, v) ->
      Node (unfold f t) u (unfold f v)

-- Basically this is exercise 2. goal, but that needs both branches
-- to look the same. This is just a demonstration that they can be
-- different.
testUnfold :: Int -> BinaryTree String
testUnfold = unfold go
  where
    go n
     | n > 7     = Nothing
     | otherwise = Just (n+2, (show n), n*2)

-- 2. Make a tree builder.
--------------------------
-- See custom Show instance for BinaryTree on top.
--
-- UPDATE:
--   Writing one function to any custom representations is the way to go:
--       parsonsmatt [9:49 AM]
--       @toraritte `Show` is best used for debugging a data structure in a way
--       that looks like the internal representation. It is almost always correct
--       to derive it, and rarely a good idea to implement it yourself. If you
--       want a specific rendering function, you should make a specific function.

treeBuild :: Integer -> BinaryTree Integer
treeBuild i = unfold go 0
  where
    go n
     | n == i    = Nothing
     | otherwise = Just (n+1, n, n+1)
