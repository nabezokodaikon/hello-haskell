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
