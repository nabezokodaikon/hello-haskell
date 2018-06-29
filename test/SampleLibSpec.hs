module SampleLibSpec (spec) where

import Test.Hspec
import SampleLib

spec :: Spec
spec = do
  describe "addition" $ do
    it "Success" $
      addition 2 1 `shouldBe` 3
