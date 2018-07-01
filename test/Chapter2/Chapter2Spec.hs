module Chapter2.Chapter2Spec (spec) where

import Test.Hspec
import Chapter2.Chapter2

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Confirm" $ do
    it "sample" $
      sample 2 `shouldBe` 4

