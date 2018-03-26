module Phone where

import Data.Char

-- validButtons = "1234567890*#"
type Digit = Char

type Button = (Digit, String)

data DaPhone = DaPhone [Button] deriving (Show, Eq)

-- Valid presses: 1 and up
type Presses = Int

-- 1 --- Create data structure
------------------------------
phone :: DaPhone
phone = DaPhone [ ('1', "1"    ),  ('2', "abc2"), ('3', "def3")
                , ('4', "ghi4" ),  ('5', "jkl5"), ('6', "mno6")
                , ('7', "pqrs7"),  ('8', "tuv8"), ('9', "wxyz9")
                , ('*', "*^"   ),  ('0', " +_0" ), ('#', "#.,")
                ]

-- 2 --- Convert conversation into keypresses
---------------------------------------------
presses :: Button -> Char -> [(Digit, Presses)]
presses (digit, xs) c = ifUpper ++ [(digit, (getPresses xs (toLower c) 1))]
  where
    ifUpper = case isUpper c of
                True  -> [('*', 1)]
                False -> []
    getPresses (x:xs) c acc =
      case (x == c) of
        True  -> acc
        False -> getPresses xs c (acc+1)

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone c = presses (button phone) c
 where
    -- button :: DaPhone -> Char -> Button
    button (DaPhone p) = head $ filter getButton p
      where
        getButton (_, xs) = elem (toLower c) xs

-- assuming the default phone definition
-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone str =
  foldr (\char list -> (reverseTaps phone char) ++ list) [] str

--- Test conversion
convo :: [String]
convo =
  ["Wanna play 20 questions",
  "Ya",
  "U 1st haha",
  "Lol ok. Have u ever tasted alcohol",
  "Lol ya",
  "Wow ur cool haha. Ur turn",
  "Ok. Do u think I am pretty Lol",
  "Lol ya",
  "Just making sure rofl ur turn"]

testConvo :: [String] -> [[(Digit, Presses)]]
testConvo = map (cellPhonesDead phone)

-- 3 ---
--------
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = foldr sumPresses 0
  where
    sumPresses (_, p) b = b + p

testFingerTaps :: [String] -> [Presses]
testFingerTaps = map countTaps
  where
    countTaps = fingerTaps . (cellPhonesDead phone)

-- 4 ---
--------
-- Maybe I didn't understand this correctly, but there is no need to use
-- any above functions for `mostPopularLetter` - the one below would suffice.
mostPopularLetter :: String -> Char
mostPopularLetter str = snd . maximum $ foldr getCharStats [] lowStr
  where
    lowStr = map toLower str
    getCharStats char b =
      case (filter (\(_,c) -> char == c) b) of
        [] ->
          b ++ [((length . (filter (==char)) $ lowStr), char)]
        xs  ->
          b ++ []

-- On the other hand, characters could tie for the first place, but an
-- unambiguous cost can be assigned to each character with the dialpad
-- representation (e.g., number of taps).
--
-- By generalizing the above function:
type Cost = Int

-- charFrequency :: String -> (Cost, Char)
charFrequency costFunction str = foldr getCharStats [] str
  where
    getCharStats char b =
      case (filter (\(_,c) -> char == c) b) of
        [] ->
          b ++ [((costFunction char str), char)]
        xs  ->
          b ++ []

-- Reimplementing `mostPopularLetter` with it:
mostPopularLetter2 :: String -> Char
mostPopularLetter2 str = snd . maximum $ charFrequency costF (lower str)
  where
    lower = map toLower
    costF char str = length . (filter (== char)) $ (lower str)

-- (...)
