module Chapter13.Chapter13 where

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
