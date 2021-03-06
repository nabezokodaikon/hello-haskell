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

bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal.\
                   \ Pffft, Ibet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"

bmiTell' :: Double -> Double -> String
bmiTell' w h
  | w / h ^ 2 <= 18.5 = "You're underweight, you emo, you!"
  | w / h ^ 2 <= 25.0 = "You're supposedly normal.\
                         \ Pffft, Ibet you're ugly!"
  | w / h ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b = b
  | otherwise = a

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a == b = EQ
  | a <= b = LT
  | otherwise = GT

bmiTell'' :: Double -> Double -> String
bmiTell'' w h
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal.\
                \ Pffft, Ibet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = w / h ^ 2

bmiTell''' :: Double -> Double -> String
bmiTell''' w h
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal.\
                    \ Pffft, Ibet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = w / h ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name

badGreeting :: String
badGreeting = "Oh! Pfft. It's you."

niceGreeting :: String
niceGreeting = "Hello! So very nice to see you,"

bmiTell'''' :: Double -> Double -> String
bmiTell'''' w h
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal.\
                    \ Pffft, Ibet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = w / h ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [ bmi w h | (w, h) <- xs ]
  where bmi w h = w / h ^ 2

calcBmis' :: [(Double, Double)] -> [String]
calcBmis' xs = [ bmi w h | (w, h) <- xs ]
  where bmi w h = bmiTell (w / h ^ 2)

cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
  in  sideArea + 2 * topArea

example3_1 :: Int 
example3_1 = 4 * (let a = 9 in a + 1) + 2

example3_2 :: (Int, Int, Int)
example3_2 = let square x = x * x in (square 5, square 3, square 2)

example3_3 :: (Int, String)
example3_3 = (let a = 100; b= 200; c = 300 in a * b * c,
              let foo="Hey "; bar ="there!" in foo ++ bar)

example3_4 :: Int
example3_4 = (let (a, b, c) = (1, 2, 3) in a + b + c) * 100

calcBmis'' :: [(Double, Double)] -> [Double]
calcBmis'' xs = [bmi | (w, h) <-xs, let bmi = w + h, bmi > 25.0]

head'' :: [a] -> a
head'' xs = case xs of [] -> error "No head for empty lists!"
                       (x: _) -> x

describeList :: [a] -> String
describeList ls = "The list is "
                  ++ case ls of [] -> "empty."
                                [x] -> "a singleton list."
                                xs -> "a longer list."

describeList' :: [a] -> String
describeList' ls = "The list is " ++ what ls
  where what [] = "empty."
        what [x] = "a singleton list."
        what xs = "a longer list."
