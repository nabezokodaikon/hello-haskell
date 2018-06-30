module SampleLibSpec (spec) where

import Test.Hspec
import SampleLib

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "addition" $ do
    it "Success" $
      addition 2 1 `shouldBe` 3
