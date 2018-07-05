module Chapter4.Chapter4 where

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x : xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n - 1) x

take' :: Int -> [a] -> [a]
take' n _ 
    | n <= 0 = []
take' _ [] = []
take' n (h : t) = h : take' (n - 1) t

reverse' :: (Ord a) => [a] -> [a]
reverse' [] = []
reverse' (h : t) = reverse' t ++ [h]

repeat' :: a -> [a]
repeat' a = a : repeat' a

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (a : as) (b : bs) = (a, b) : zip' as bs

elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x : xs)
  | a == x = True
  | otherwise = a `elem` xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  let l = [ a | a <- xs, a <= x ]
      r = [ a | a <- xs, a > x ]
  in quicksort l ++ [x] ++ quicksort r
