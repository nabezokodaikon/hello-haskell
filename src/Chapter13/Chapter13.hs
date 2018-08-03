module Chapter13.Chapter13 where

import Control.Monad

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x


type Birds = Int
type Pole = (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n) 
    | otherwise = Nothing

x -: f = f x

banana :: Pole -> Maybe Pole
banana _ = Nothing

foo :: Maybe String
foo = Just 3 >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))

foo' :: Maybe String
foo' = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

marySue :: Maybe Bool
marySue = Just 9 >>= (\x -> Just (x > 8))

marySue' :: Maybe Bool
marySue' = do
    x <- Just 9
    Just (x > 8)

justH :: Maybe Char
justH = do
    (x : xs) <- Just "hello"
    return x

wopwop :: Maybe Char
wopwop = do
    (x : xs) <- Just ""
    return x

listOfTuples :: [(Int, Char)]
listOfTuples = do
    n <- [1, 2]
    ch <- ['a', 'b']
    return (n, ch)

sevensOnly :: [Int]
sevensOnly = do
    x <- [1..50]
    guard ('7' `elem` show x)
    return x

type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c, r) = do
    (c', r') <- [(c + 2, r - 1), (c + 2, r + 1), (c - 2, r - 1), (c - 2, r + 1)
                ,(c + 1, r - 2), (c + 1, r + 2), (c - 1, r - 2), (c - 1, r + 2)
                ]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c', r')

moveKnight' :: KnightPos -> [KnightPos]
moveKnight' (c, r) = filter onBoard
    [(c + 2, r - 1), (c + 2, r + 1), (c - 2, r - 1), (c - 2, r + 1)
    ,(c + 1, r - 2), (c + 1, r + 2), (c - 1, r - 2), (c - 1, r + 2)
    ]
    where onBoard (c, r) = c `elem` [1..8] && r `elem` [1..8]

in3 :: KnightPos -> [KnightPos]
in3 start = do
    first <- moveKnight start
    second <- moveKnight first
    moveKnight second

in3' start = return start >>= moveKnight >>= moveKnight >>=moveKnight

canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start
