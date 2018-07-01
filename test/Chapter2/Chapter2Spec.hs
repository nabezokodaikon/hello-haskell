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
