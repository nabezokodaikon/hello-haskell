module Chapter4.Chapter4Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter5.Chapter5

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter5" $ do
