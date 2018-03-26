module Vehicles where

data Price = Price Integer deriving (Eq, Show)
data Size  = Size  Integer deriving (Eq, Show)

data Manufacturer =
    Mini
  | Mazda
  | Tata
  deriving (Eq, Show)

data Airline =
    PapuAir
  | CatapultsR'Us
  | TakeYourChancesUnited
  deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline
             --5 | Plane Airline Size
             deriving (Eq, Show)

myCar    = Car Mini (Price 14000)
urCar    = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge     = Plane PapuAir
--5 doge     = Plane PapuAir (Size 2)

-- 2 ---
isCar :: Vehicle -> Bool
isCar (Car _ _ ) = True
isCar _          = False

isPlane :: Vehicle -> Bool
isPlane v =
  case v of
    Plane _ -> True
    --5 Plane _ _ -> True
    _       -> False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

 --- bonus
carsThere :: [Vehicle] -> Bool
carsThere = or . map isCar

-- 3 ---
-- This can only be a partial function
-- with this signature. (To my current
-- knowledge.)
getManu :: Vehicle -> Manufacturer
getManu (Car m _) = m

-- 5 ---
-- See lines commented out with "--5"
