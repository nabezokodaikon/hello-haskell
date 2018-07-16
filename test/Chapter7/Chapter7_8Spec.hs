module Chapter7.Chapter8_7Spec (spec) where

import Test.Hspec
import Chapter7.Chapter7_8

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7_8 型クラス 中級講座" $ do
