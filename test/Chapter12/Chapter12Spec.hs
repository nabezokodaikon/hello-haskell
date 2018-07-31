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
        it "Product" $
            getProduct (Product 3 `mappend` Product 9) `shouldBe` 27
        it "Product 2" $
            getProduct (Product 3 `mappend` mempty) `shouldBe` 3
        it "Product 3" $ do
            (getProduct . mconcat . map Product $ [3, 4, 2]) `shouldBe` 24
        it "Sum" $
            (getSum $ Sum 2 `mappend` Sum 9) `shouldBe` 11
        it "Sum 2" $
            (getSum . mconcat . map Sum $ [1, 2, 3]) `shouldBe` 6
        it "getAny" $
            getAny (Any True `mappend` Any False) `shouldBe` True
        it "getAny 2" $
            (getAny . mconcat . map Any $ [False, False, False, True]) `shouldBe` True
        it "getAll" $
            (getAll $ mempty `mappend` All True) `shouldBe` True
        it "getAll 2" $
            (getAll . mconcat .map All $ [True, True, True]) `shouldBe` True 
        it "getAll 3" $
            (getAll . mconcat .map All $ [True, True, False]) `shouldBe` False
        it "lengthCompare" $
            lengthCompare "zen" "ants" `shouldBe` LT
        it "lengthCompare 2" $
            lengthCompare "zen" "ant" `shouldBe` GT
        it "lengthCompare'" $
            lengthCompare' "zen" "ants" `shouldBe` LT
        it "lengthCompare' 2" $
            lengthCompare' "zen" "ant" `shouldBe` GT
        it "lengthCompare''" $
            lengthCompare'' "zen" "anna" `shouldBe` LT
        it "lengthCompare''" $
            lengthCompare'' "zen" "ana" `shouldBe` LT
        it "lengthCompare''" $
            lengthCompare'' "zen" "ann" `shouldBe` GT
