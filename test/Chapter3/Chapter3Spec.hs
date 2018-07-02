module Chapter3.Chapter3Spec (spec) where

import Test.Hspec
import Chapter3.Chapter3

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Type" $ do
