-- stack runghc src/Chapter11/Chapter11.hs

module Chapter11.Chapter11 where

import Control.Applicative

data CMaybe a = CNothing | CJust Int a deriving (Show, Eq)

-- ファンクタ則を満たしていない例
instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter + 1) (f x)

{--
instance Applicative Maybe where
    pure = Just
    Nothing <*> _ = Nothing
    (Just f) <*> something = fmap f something
--}

myAction :: IO String
myAction = do
    a <- getLine
    b <- getLine
    return $ a ++ b

myAction' :: IO String
myAction' = (++) <$> getLine <*> getLine

main = do
    a <- (++) <$> getLine <*> getLine
    putStrLn a
