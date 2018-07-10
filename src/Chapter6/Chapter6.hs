module Chapter6.Chapter6 where

import Data.Char
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
