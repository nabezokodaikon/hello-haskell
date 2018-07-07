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

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

{-
   ラムダ式(\acc x -> acc + x)は(+)と同じ。
   foldl (+) 0 はリストを取る関数を返すので、引数のxsは省略できる。
   一般に foo a = bar b a は、カリー化により、
   foo = bar b に書き換えれる。
-}
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

{-
`++`関数は`:`関数よりも遅いため、
リストから新しいリストを構築する際には、
基本的に右畳み込みを使う。
右は無限リストに対して動作するのに対し、左は動作しない。
-}
map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

{-
   foldl1とfoldr1は、空リストを渡すとランタイムエラーになる。
-}
maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max
{- maximum' xs = foldl1 max xs -}

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) [] 

reverse'' :: [a] -> [a]
reverse'' = foldl(flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldl (*) 1
{- product' = foldl (\acc x -> acc * x) 1 -}

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' p = foldr (\x acc -> if p x then x : acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

