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
    it "area of Rectangle" $
      (area $ Rectangle 0 0 10 10) `shouldBe` 100
    it "map and curry" $
      map (Circle 10 20) [1, 2] `shouldBe` [Circle 10 20 1, Circle 10 20 2]
      {- map (\a -> Circle 10 20 a) [1, 2] `shouldBe` [Circle 10 20 1, Circle 10 20 2] -}
    it "area of Circle'" $
      area' (Circle' (Point 10 20) 10) `shouldBe` 314.15927
    it "area of Rectangle'" $
      area' (Rectangle' (Point 0 0) (Point 10 10)) `shouldBe` 100
    it "nudge of Circle" $
      nudge (Circle' (Point 10 20) 30) 5 10 `shouldBe` (Circle' (Point 15 30) 30)
    it "nudge of Rectangle" $
      nudge (Rectangle' (Point 1 2) (Point 3 4)) 10 20 `shouldBe` Rectangle' (Point 11 22) (Point 13 24)
    it "nudge of Circle2" $
      nudge (baseCircle 10) 1 2 `shouldBe` Circle' (Point 1 2) 10
    it "nudge of Rectangle2" $
      nudge (baseRect 2 3) 1 2 `shouldBe` Rectangle' (Point 1 2) (Point 3 5)
