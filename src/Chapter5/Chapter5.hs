module Chapter5.Chapter5 where

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

multThree' :: Int -> (Int -> (Int -> Int))
multThree' x y z = x * y * z

compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x

compareWithHundred' :: Int -> Ordering
compareWithHundred' = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

minusFour :: Int -> Int
minusFour = subtract 4

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x

flip'' :: (a -> b -> c) -> (b -> a -> c)
flip'' f y x = f x y

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x : xs)
      | p x = x : filter' p xs
      | otherwise = filter' p xs

largestDivisible :: Int -> Int -> Int
largestDivisible a b = head (filter' p [a, (a - 1)..])
  where p x = x `mod` b == 0

chain :: Int -> [Int]
chain 1 = [1]
chain n
    | even n = n : chain(n `div` 2)
    | odd n = n : chain(n * 3 + 1)

numLogChains :: Int
numLogChains = length (filter isLong (map chain [1..100])) 
  where isLong xs = length xs > 15

numLogChains' :: Int
numLogChains' = length (filter ((> 15) . length) (map chain [1..100]))

numLogChains'' :: Int
numLogChains'' = length (filter (\xs -> length xs > 15)
                                (map chain [1..100]))

flip''' :: (a -> b -> c) -> b -> a -> c
flip''' f = \x y -> f y x
