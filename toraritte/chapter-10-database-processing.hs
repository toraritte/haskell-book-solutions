module DatabaseProcessing where

import Data.Time

data DatabaseItem = DbString String
  | DbNumber Integer
  | DbDate   UTCTime
  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase =
  [ DbDate (UTCTime
      (fromGregorian 1911 5 1)
      (secondsToDiffTime 34123))
  , DbNumber 9001
  , DbString "Hello, world!"
  , DbDate (UTCTime
      (fromGregorian 1921 5 1)
      (secondsToDiffTime 34123))
  ]

-- -- Just getting the basics down
-- f :: DbDate -> UTCTime
-- f (DbDate a) = a

-- g :: UTCTime -> (Day, DiffTime)
-- g (UTCTime a b) = (a,b)

-- -- lambda> g . f $ head theDatabase

-- 1 --------------------------------------------------------
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = foldr getUTCTimes [] db
  where
    getUTCTimes :: DatabaseItem -> [UTCTime] -> [UTCTime]
    getUTCTimes (DbDate u) xs = (u:xs)
    getUTCTimes _ xs          = xs

-- 2 --------------------------------------------------------
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = foldr getDbNumbers [] db
  where
    getDbNumbers (DbNumber i) xs = (i:xs)
    getDbNumbers _            xs = xs

-- 3 --------------------------------------------------------
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent db = foldr getRecent (head utcs) utcs
  where
    utcs = filterDbDate db
    -- implies Ord instance UTCTime
    getRecent = max

-- 4 --------------------------------------------------------
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- 5 --------------------------------------------------------
avgDb :: [DatabaseItem] -> Double
avgDb db = dbNumSum / dbNumLength
  where
    dbNumSum    = fromIntegral . sumDb $ db
    dbNumLength = fromIntegral . length . filterDbNumber $ db
