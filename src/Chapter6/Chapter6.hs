module Chapter6.Chapter6 where

import Data.Char
import qualified Data.Map as Map
import Data.Maybe
import Data.List
{- import Data.List (nub, sort) -}
{- import qualified Data.List (nub) -}
import qualified Data.List as L (nub)

{- ポイントフリースタイル -}
numUniques :: (Eq a) => [a] -> Int
numUniques = length . L.nub

numUniques' :: (Eq a) => [a] -> Int
numUniques' = \xs -> length (L.nub xs)

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words
{- wordNums xs = map (\ws -> (head ws, length ws)) (group (sort (words xs))) -}

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

encode :: Int -> String -> String
encode offset msg = map (chr . (+ offset) . ord) msg
{- encode offset msg = map (\c -> chr $ ord c + offset) msg -}

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
{-
digitSum d = sum (map (\c -> digitToInt c) (show d))
digitSum d = sum (map (digitToInt) $ show d)
digitSum d = sum (map digitToInt $ show d)
digitSum d = sum . map digitToInt $ show d
-}
digitSum = sum . map digitToInt . show

firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

phoneBook = 
  [("betty", "555-2938")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ]

findKey :: (Eq k) => k -> [(k, v)] -> v
{- findKey key xs = snd (head (filter(\(k, v) -> key == k) $ xs))  -}
findKey key xs = snd . head . filter(\(k, v) -> key == k) $ xs 

findKey' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k, v) : xs)
  | key == k = Just v
  | otherwise = findKey' key xs

findKey'' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey'' key xs = foldr
  (\(k, v) acc -> if key == k then Just v else acc)
  Nothing
  xs

phoneBook' :: Map.Map String String
phoneBook' = Map.fromList phoneBook

string2digits :: String -> [Int]
{- string2digits s = map(\c -> digitToInt c) (filter(\c -> isDigit c) s)  -}
{- string2digits s = map(digitToInt) (filter(isDigit) s)  -}
{- string2digits s = map digitToInt (filter isDigit s)  -}
string2digits = map digitToInt . filter isDigit 

phoneBook'' =
  [("betty", "555-2938")
  ,("betty", "555-3000")
  ,("betty", "555-4000")
  ,("bonnie", "452-2928")
  ,("bonnie", "452-4000")
  ,("patsy", "493-2928")
  ]

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs 
  where add n1 n2 = n1 ++ ", " ++ n2

phoneBookToMap' :: (Ord k) => [(k, a)] -> Map.Map k [a]
phoneBookToMap' xs = Map.fromListWith (++) $ map (\(k, v) -> (k, [v])) xs
