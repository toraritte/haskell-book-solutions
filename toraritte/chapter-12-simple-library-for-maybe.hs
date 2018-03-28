module SimpleLibraryForMaybe where

-- 1. Simple boolean checks for Maybe values.
---------------------------------------------
-- >>> isJust (Just 1)
-- True
-- >>> isJust Nothing
-- False
isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _       = True

-- >>> isNothing (Just 1)
-- False
-- >>> isNothing Nothing
-- True
isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _       = False

-- 2. The following is the Maybe catamorphism. You can turn a
-- Maybe value into anything else with this.
-------------------------------------------------------------
-- >>> mayybee 0 (+1) Nothing
-- 0
-- >>> mayybee 0 (+1) (Just 1)
-- 2
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee b _ Nothing = b
mayybee b f (Just a) = f a

-- 3. In case you just want to provide a fallback value.
--------------------------------------------------------
-- >>> fromMaybe 0 Nothing
-- 0
-- >>> fromMaybe 0 (Just 1)
-- 1
fromMaybe :: a -> Maybe a -> a
fromMaybe a maybe = mayybee a id maybe

-- 4. Converting between List and Maybe.
----------------------------------------
-- >>> listToMaybe [1, 2, 3]
-- Just 1
-- >>> listToMaybe []
-- Nothing
listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe xs = Just (head xs)

-- >>> maybeToList (Just 1)
-- [1]
-- >>> maybeToList Nothing
-- []
maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just a) = [a]

-- 5. For when we want to drop the Nothing values from our list.
----------------------------------------------------------------
-- >>> catMaybes [Just 1, Nothing, Just 2]
-- [1, 2]
-- >>> let xs = take 3 $ repeat Nothing
-- >>> catMaybes xs
-- []
catMaybes :: [Maybe a] -> [a]
catMaybes xs = map (fromMaybe undefined) (filter isJust xs)

catMaybesPointFree :: [Maybe a] -> [a]
catMaybesPointFree = (map (fromMaybe undefined)) . (filter isJust)

-- 6. You’ll see this called “sequence” later.
----------------------------------------------
-- >>> flipMaybe [Just 1, Just 2, Just 3]
-- Just [1, 2, 3]
-- >>> flipMaybe [Just 1, Nothing, Just 3]
-- Nothing
flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe ms =
  case (filter isNothing ms) of
    [] -> Just (catMaybes ms)
    _  -> Nothing

-- See Stackoverflow link below why this throws an error the way it is.
-- https://stackoverflow.com/questions/49519683/why-is-eq-a-constraint-required-for-the-solution-using-elem

-- flipMaybe2 :: [Maybe a] -> Maybe [a]
-- flipMaybe2 ms
--   | Nothing `elem` ms = Nothing
--   | otherwise         = Just (catMaybes ms)
