module ValidateTheWord where

newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord str
  | isValidWord str = Just (Word' str)
  | otherwise       = Nothing

isValidWord :: String -> Bool
isValidWord str = go str (0,0)
  where
    go [] (vowelCount, consonantCount) = vowelCount < consonantCount
    go (char:xs) (vC, cC)
     | char `elem` vowels = go xs (vC+1, cC)
     | otherwise          = go xs (vC, cC+1)
