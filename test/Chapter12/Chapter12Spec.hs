module Chapter12.Chapter12Spec (spec) where

import Test.Hspec
import Chapter12.Chapter12
import Data.Monoid

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "12.1 既存の方を新しい型にくるむ" $ do
        it "CharList" $
            CharList "abc" `shouldBe` CharList { getCharList = "abc" }
        it "CharList 2" $
            CharList "abc" == CharList "abc" `shouldBe` True
        it "CharList 3" $
            CharList "abc" == CharList "def" `shouldBe` False 
        it "Pair" $
            getPair (fmap (*100) (Pair (2, 3))) `shouldBe` (200, 3)
    describe "12.3 " $ do
        it "リストはモノイド" $
            [1, 2, 3] `mappend` [4, 5, 6] `shouldBe` [1, 2, 3, 4, 5, 6]
        it "リストはモノイド 2" $
            mconcat [[1, 2], [3, 6], [9]] `shouldBe` [1, 2, 3, 6, 9]
        -- it "リストはモノイド 3" $
            -- mempty :: [a] `shouldBe` []
