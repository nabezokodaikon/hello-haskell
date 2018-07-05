module Chapter4.Chapter4Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter4.Chapter4

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter4" $ do
    it "maximum'" $
      maximum' [1, 5, 3] `shouldBe` 5
    it "maximum'2" $
      maximum' [1] `shouldBe` 1
    {- TODO: replでは実行できた。
    it "maximum'3" $
      evaluate (maximum' []) `shouldThrow` anyException
    -}
