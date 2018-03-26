module LanguageExercises where

import Data.Char

-- 1 ---
capitalizeWord :: String -> String
capitalizeWord (c:chars) = (toUpper c) : chars

-- 2 ---
---- Probably the most over-complicated solution there is.
capitalizeSpacedWord :: String -> String
capitalizeSpacedWord rest@(c:chars)
  | c == ' '  = c : (capitalizeSpacedWord chars)
  | otherwise = capitalizeWord rest

capitalizeParagraph :: String -> String
capitalizeParagraph p = go p ""
  where
    go [] acc = ""
    go (c:chars) acc
     | c == '.'  = capitalizeSpacedWord (reverse (c:acc)) ++ (go chars "")
     | otherwise = go chars (c:acc)
