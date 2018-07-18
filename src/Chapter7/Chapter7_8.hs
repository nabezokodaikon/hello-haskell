module Chapter7.Chapter7_8 where

import Data.Functor

{-
Eq型クラス
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x == y = not (x /= y)
  x /= y = not (x == y)
-}

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  Red == Red = True
  Yellow == Yellow = True
  Green == Green = True
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Show, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x -- xを唯一の要素として持つ木を挿入する。
treeInsert x (Node a left right)
  | x == a = Node x left right -- 新しい要素とルート要素が等しければ、元の木をそのまま返す。
  | x < a = Node a (treeInsert x left) right -- 新しい要素が挿入された左部分木を持つ木を返す。
  | x > a = Node a left (treeInsert x right) -- 新しい要素が挿入された右部分木を持つ木を返す。

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a = treeElem x left
  | x > a = treeElem x right

instance YesNo (Tree a) where
  yesno EmptyTree = False
  yesno _ = True

instance YesNo TrafficLight where
  yesno Red = False
  yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult =
  if yesno yesnoVal
     then yesResult
     else noResult

{-
ファンクタの実装。
class Functor f where
  fmap :: (a -> b) -> f a -> f b

mapとは`[]`限定のファンクタ。
instance Functor [] where
  fmap = map

Maybeもファンクタ。
instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmap f Nothing = Nothing

Eitherの場合、引数を1つだけ部分適用する。
instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x) = Left (f x)
-}

instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)
