-- stack runghc src/Chapter12/Chapter12.hs

module Chapter12.Chapter12 where

newtype CharList = CharList { getCharList :: [Char] }
    deriving (Eq, Show)

newtype Pair b a = Pair { getPair :: (a, b) }

instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)
