module Chapter3.Chapter3 where

lucky :: Int -> String
lucky 7 = "Is 7"
lucky x = "Is not 7"

sayMe :: Int -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe x = "Not between 1 and 3"

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

listMatch :: [(Int, Int)] -> [Int]
listMatch xs = [a + b | (a, b) <- xs]

head' :: [a] -> a
head' [] = error "Empty list"
head' (x : _) = x

tell :: (Show a) => [a] -> String
tell [] = "Empty"
tell (x : []) = "One"
tell (x : y : []) = "Two"
tell (x : y : _) = "Long"

badAdd :: (Num a) => [a] -> a
badAdd (x : y : z : []) = x + y + z

firstLetter :: String -> String
firstLetter "" = "Empty"
firstLetter all@(x : xs) = all ++ " is " ++ [x]
