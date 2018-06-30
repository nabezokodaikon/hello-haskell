module Chapter1.Chapter1Spec (spec) where

import Test.Hspec
import Chapter1.Chapter1

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "doubleMe" $ do
    it "Success" $
      doubleMe 2 `shouldBe` 4

