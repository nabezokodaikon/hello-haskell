module Chapter7.Chapter7_7 where

data MyList a = MyEmpty | Cons a (MyList a) deriving (Show, Read, Eq, Ord)
{- 上と同義 -}
data MyList' b = MyEmpty' | Cons' { listhead :: b, listTail :: MyList' b }
  deriving (Show, Read, Eq, Ord)

infixr 5 :-:
data List a = Empty | a :-: (List a)
  deriving (Show, Read, Eq, Ord)

infixr ^++
(^++) :: List a -> List a -> List a
Empty ^++ ys = ys
(x :-: xs) ^++ ys = x :-: (xs ^++ ys) -- 値コンストラクタをマッチさせる。(パターンマッチ)

{- 木を植えよう -}
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

myTree = foldr treeInsert EmptyTree [8, 6, 4, 1, 7, 3, 5]
