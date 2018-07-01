module Chapter2.Chapter2 where

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <-st, c `elem` ['A'..'Z'] ]

addThree :: Int -> Int -> Int-> Int
addThree x y z = x + y + z
