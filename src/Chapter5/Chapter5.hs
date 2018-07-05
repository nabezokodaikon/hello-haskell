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
