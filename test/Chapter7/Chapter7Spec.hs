module Chapter7.Chapter7Spec (spec) where

import Test.Hspec
import Chapter7.Chapter7

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7" $ do
    it "area of Circle" $
      (area $ Circle 10 20 10) `shouldBe` 314.15927
    it "area Of Rectangle" $
      (area $ Rectangle 0 0 10 10) `shouldBe` 100
    it "map and curry" $
      map (Circle 10 20) [1, 2] `shouldBe` [Circle 10 20 1, Circle 10 20 2]
      {- map (\a -> Circle 10 20 a) [1, 2] `shouldBe` [Circle 10 20 1, Circle 10 20 2] -}
