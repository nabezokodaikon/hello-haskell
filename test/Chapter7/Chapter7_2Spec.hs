module Chapter7.Chapter7_2Spec (spec) where

import Test.Hspec
import Chapter7.Chapter7_2

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7_2" $ do
    it "Person Eq" $
      Person { firstName = "a"
             , lastName = "b"
             , age = 1
             }
      `shouldBe` 
      Person { firstName = "a"
             , lastName = "b"
             , age = 1
             }
    it "Person Eq 2" $
      Person { firstName = "a"
             , lastName = "b"
             , age = 1
             }
      `shouldNotBe`
      Person { firstName = "a"
             , lastName = "b"
             , age = 2
             }
    it "Person Show" $
      show mikeD `shouldBe` "Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"
    it "Person Read" $
      (read mysteryDude :: Person) `shouldBe` mikeD
    it "Person Read 2" $
      read mysteryDude `shouldBe` mikeD
    it "Maybe Read" $
      (read "Just 3" :: Maybe Int) `shouldBe` Just 3
    it "Bool" $
      True `compare` False `shouldBe` GT
    it "Bool2" $
      True > False `shouldBe` True
    it "Bool3" $
      True < False `shouldBe` False
    it "Maybe" $
      Nothing < Just 100 `shouldBe` True
    it "Maybe2" $
      Nothing > Just (-9999) `shouldBe` False
    it "Maybe3" $
      Just 3 `compare` Just 2 `shouldBe` GT
    it "Maybe4" $
      Just 100 > Just 50 `shouldBe` True
