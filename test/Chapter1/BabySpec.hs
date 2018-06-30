module Chapter1.BabySpec (spec) where

import Test.Hspec
import Chapter1.Baby

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "doubleMe" $ do
    it "Success" $
      doubleMe 2 `shouldBe` 4
  describe "doubleUs" $ do
    it "Success" $
      doubleUs 2 3 `shouldBe` 10
  describe "doubleSmallNumber" $ do
    it "Success" $
      doubleSmallNumber 2 `shouldBe` 4
    it "Success2" $
      doubleSmallNumber 101 `shouldBe` 101
  describe "doubleSmallNumber'" $ do
    it "Success" $
      doubleSmallNumber' 2 `shouldBe` 5
  describe "conanO'Brien" $ do
    it "Success" $
      conanO'Brien `shouldBe` "It's a=me, Conan O'Brien!"
