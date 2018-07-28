module Chapter11.Chapter11 where

data CMaybe a = CNothing | CJust Int a deriving (Show, Eq)

-- ファンクタ則を満たしていない例
instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter + 1) (f x)
