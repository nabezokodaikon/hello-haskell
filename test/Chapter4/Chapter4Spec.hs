module Chapter4.Chapter4Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter4.Chapter4

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Pattern match" $ do
