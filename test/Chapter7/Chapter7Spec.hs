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
    it "record syntax" $
      Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate" `shouldBe`
      Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
    it "firstName" $
      (firstName $ Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate") `shouldBe`
      "Buddy"
    it "Car" $
      model Car { company = "Ford", model = "Mustang", year = 1967 } `shouldBe` "Mustang"
    it "Car2" $
      Car { company = "Ford", model = "Mustang", year = 1967 } { year = 2013 } `shouldBe`
      Car { company = "Ford", model = "Mustang", year = 2013 }
    it "tellCar" $
      tellCar Car { company = "Ford", model = "Mustang", year = 1967 } `shouldBe`
      "This Ford Mustang was made in 1967"
    it "tellCar'" $
      tellCar' (Car' "Ford" "Mustang" 1967) `shouldBe` "This Ford Mustang was made in 1967"
    it "tellCar'2" $
      tellCar' (Car' "Ford" "Mustang" "1967") `shouldBe` "This Ford Mustang was made in \"1967\""
    it "vplus" $
      Vector 1 2 3 `vplus` Vector 4 5 6 `shouldBe` Vector 5 7 9
    it "dotProd" $
      Vector 1 2 3 `dotProd` Vector 4 5 6 `shouldBe` 32
    it "vmult" $
      Vector 1 2 3 `vmult` Vector 4 5 6 `shouldBe` Vector 4 10 18
