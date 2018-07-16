module Chapter7.Chapter7_7Spec (spec) where

import Test.Hspec
import Chapter7.Chapter7_7

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7_7" $ do
