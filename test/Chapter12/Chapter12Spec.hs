module Chapter12.Chapter12Spec (spec) where

import Test.Hspec
import Chapter12.Chapter12

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
