module Chapter1.BabySpec (spec) where

import Test.Hspec
import Chapter1.Baby

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "doubleMe" $ do
    it "Success" $
      doubleMe 2 `shouldBe` 4

