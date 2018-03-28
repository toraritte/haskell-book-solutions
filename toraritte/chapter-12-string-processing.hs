module StringProcessing where

-- 1 ---
--------

-- Maybe it's too late, but the helper function didn't make too
-- much sense too me. The function below works fine, but did
-- another version in the end.

replaceThe2 :: String -> String
replaceThe2 str = foldr theToA [] (words str)
  where
    theToA "the" b = "a" ++ " " ++ b
    theToA xs []   = xs ++ []
    theToA xs b    = xs ++ " " ++ b

-- example GHCi session
-- above the functions
-- >>> notThe "the"
-- Nothing
-- >>> notThe "blahtheblah"
-- Just "blahtheblah"
-- >>> notThe "woot"
-- Just "woot"
notThe :: String -> Maybe String
notThe "the" = Nothing
notThe str   = Just str

-- >>> replaceThe "the cow loves us"
-- "a cow loves us"
replaceThe :: String -> String
replaceThe str = go (map notThe $ words str) []
  where
    -- Just to keep the erlang style in memory
    go [] acc = unwords . reverse $ acc
    go (Nothing:xs) acc  = go xs ("a":acc)
    go ((Just w):xs) acc = go xs (w:acc)

-- 2 ---
--------
-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1

-- Commented out lines show how would it go without
-- using the `notThe` helper
countTheBeforeVowel :: String -> Integer
countTheBeforeVowel str = go (map notThe $ words str) 0
-- countTheBeforeVowel str = go (words str) 0
  where
    go [] acc = acc
    go (Nothing : xs@((Just (c:_)):_)) acc =
    -- go ("the"  : xs@((c:_):_)) acc =
      case (c `elem` "aeiou") of
        True  -> go xs (acc+1)
        False -> go xs acc
    go (_:xs) acc = go xs acc

-- 3 ---
--------
countVowels :: String -> Integer
countVowels = foldr go 0
  where
    go char b =
      case (char `elem` "aeiuo") of
        True  -> b+1
        False -> b
