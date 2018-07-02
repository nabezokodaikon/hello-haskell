module Chapter2.Chapter2Spec (spec) where

import Test.Hspec
import Chapter2.Chapter2

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Type" $ do
    it "removeNonUppercase" $
      removeNonUppercase "AbC" `shouldBe` "AC"
    it "addThree" $
      addThree 1 2 3 `shouldBe` 6
  describe "2.2" $ do
    it "factorial" $
      factorial 3 `shouldBe` 6
    it "circumference" $
      circumference 3.5 `shouldBe` 21.99115 
    it "circumference'" $
      circumference' 3.5 `shouldBe` 21.991148575128552 
  describe "2.4" $ do
    it "compare" $
      5 `compare` 3 `shouldBe` GT
    it "compare2" $
      5 `compare` 5 `shouldBe` EQ
    it "compare3" $
      5 `compare` 7 `shouldBe` LT 
    it "show" $
      show 3 `shouldBe` "3"
    it "read" $
      read "True" || False `shouldBe` True
    it "Enum" $
      [2..5] `shouldBe` [2, 3, 4, 5]
    it "Enum2" $
      succ 3 `shouldBe` 4
    it "Enum3" $
      pred 3 `shouldBe` 2
    it "Integral" $
      fromIntegral (length [1, 2, 3, 4]) + 3.2 `shouldBe` 7.2
