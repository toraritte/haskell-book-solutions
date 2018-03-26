module Cipher where

import Data.Char

caesar :: String -> Int -> String
caesar str shiftNum = [ caseWrapAround c shiftNum | c <- str]

-- *Cipher Data.Char> caesar "sYZgy" 3
-- "vBCjb"

-- *Cipher Data.Char> caesar "vBCjb" (-3)
-- "sYZgy"

wrapAround :: Char -> Int -> Char
wrapAround c i
  | ordOfShiftedChar > ordZ =
      chr( ordOfShiftedChar - ordZ + ordA -1)
  | ordOfShiftedChar < ordA =
      chr( ordZ - (ordA - ordOfShiftedChar) + 1)
  | otherwise = chr(ordOfShiftedChar)
    where
      ordOfShiftedChar = (ord c) + i
      ordZ = ord 'z'
      ordA = ord 'a'

caseWrapAround :: Char -> Int -> Char
caseWrapAround c i =
  case isUpper c of
 -- True  -> toUpper . (wrapAround $ toLower c) $ i
    True  -> toUpper( wrapAround (toLower c) i )
    False -> wrapAround c i
