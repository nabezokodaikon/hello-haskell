module Chapter7.Chapter7Spec (spec) where

import Chapter7.Chapter7

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7" $ do
