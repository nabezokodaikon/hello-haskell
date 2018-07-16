module Chapter7.Chapter7_7 where

data MyList a = MyEmpty | Cons a (MyList a) deriving (Show, Read, Eq, Ord)
{- 上と同義 -}
data MyList' b = MyEmpty' | Cons' { listhead :: b, listTail :: MyList' b }
  deriving (Show, Read, Eq, Ord)
