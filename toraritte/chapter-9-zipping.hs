module Zipping where

myZip :: [a] -> [b] -> [(a, b)]
myZip (x:_) (y:[]) = [(x,y)]
myZip (x:[]) (y:_) = [(x,y)]
myZip (x:xs) (y:ys) = ((x,y) : (myZip xs ys))

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f (x:[]) (y:_) = [f x y]
myZipWith f (x:_) (y:[]) = [f x y]
myZipWith f (x:xs) (y:ys) = ( (f x y) : (myZipWith f xs ys))

myZipWithMyZipWith :: [a] -> [b] -> [(a,b)]
myZipWithMyZipWith xs ys = myZipWith (,) xs ys
