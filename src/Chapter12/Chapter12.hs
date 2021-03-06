-- stack runghc src/Chapter12/Chapter12.hs

module Chapter12.Chapter12 where

import Data.Monoid
import qualified Data.Foldable as F

newtype CharList = CharList { getCharList :: [Char] }
    deriving (Eq, Show)

newtype Pair b a = Pair { getPair :: (a, b) }

instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in  if a == EQ then b else a

lengthCompare' :: String -> String -> Ordering
lengthCompare' x y = (length x `compare` length y) `mappend`
                     (x `compare` y)

lengthCompare'' :: String -> String -> Ordering
lengthCompare'' x y = (length x `compare` length y) `mappend`
                      (vowels x `compare` vowels y) `mappend`
                      (x `compare` y)
    where vowels = length . filter (`elem` "aeiou")

-- instance Monoid a => Monoid (Maybe a) where
    -- mempty = Nothing
    -- Nothing `mappend` m = m
    -- m `mappend` Nothing = m
    -- Just m1 `mappend` Just m2 = Just (m1 `mappend` m2)

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Show, Eq)

instance F.Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

testTree = Node 5
            (Node 3
                (Node 1 EmptyTree EmptyTree)
                (Node 6 EmptyTree EmptyTree)
            )
            (Node 9
                (Node 8 EmptyTree EmptyTree)
                (Node 10 EmptyTree EmptyTree)
            )
