module Chapter9Exercises where

import Data.Char

-- 2. Filter lowercase letter from string.
filterLowercase :: String -> String
filterLowercase str = [c | c <- str, (isUpper c)]

filterLowercase2 :: String -> String
filterLowercase2 str = filter isUpper str

-- 3. Capitalize first letter of string.
capitalizeFirst :: String -> String
capitalizeFirst (c:cs) = ( (toUpper c) : cs)

-- 4. Capitalize every character in string.
capAll :: String -> String
capAll (c:[]) = [toUpper c]
capAll (c:cs) = ( (toUpper c) : capAll cs)

capAll2 :: String -> String
capAll2 str = [(toUpper c) | c <- str]

-- 5. Capitalize and return first letter of a string.
returnCapitalizedFirst :: String -> Char
returnCapitalizedFirst str = toUpper $ head str

-- 6. Rewrite 5. using composition and then in point-free
--    form.
rcfC :: String -> Char
rcfC str = toUpper . head $ str

rcfPF :: String -> Char
rcfPF = toUpper . head
