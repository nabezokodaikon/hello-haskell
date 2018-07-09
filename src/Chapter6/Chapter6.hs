module Chapter6.Chapter6 where

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
