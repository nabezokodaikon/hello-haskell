module Chapter4.Chapter4Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter5.Chapter5

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter5" $ do
    it "max" $
      max 4 5 `shouldBe` (max 4) 5
    it "multThree" $
      multThree 3 5 9 `shouldBe` ((multThree 3) 5) 9
    it "compareWithHundred" $
      compareWithHundred 99 `shouldBe` GT
    it "compareWithHundred2" $
      compareWithHundred 99 `shouldBe` compareWithHundred' 99
    it "divideByTen" $
      divideByTen 200 `shouldBe` 200 / 10
    it "isUpperAlphanum" $
      isUpperAlphanum 'a' `shouldBe` False
    it "minusFour" $
      minusFour 3 `shouldBe` -1
