module VigenereCipher where

import Data.Char

type Keyword = String
type Message = String

vigenere :: Message -> Keyword -> String
vigenere message keyword = go message (cycle keyword)
  where
    go [] _ = []
    go (' ':ms) ks     =             ' ' : (go ms ks)
    go (m  :ms) (k:ks) = (shiftChar m k) : (go ms ks)

shiftChar :: Char -> Char -> Char
shiftChar from using = abcycle !! (charPos from + charPos using)

charPos :: Char -> Int
charPos c = ord c - ord 'A'

abcycle :: String
abcycle = cycle ['A'..'Z']
