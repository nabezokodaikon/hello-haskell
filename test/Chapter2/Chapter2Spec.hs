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
