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
  describe "List" $ do
    it "Union" $
      [1, 2, 3, 4] ++ [9, 10, 11, 12] `shouldBe` [1, 2, 3, 4, 9, 10, 11, 12]
    it "Union2" $
      'A' : " SMALL CAT" `shouldBe` "A SMALL CAT"
    it "Union3" $
      5: [1, 2] `shouldBe` [5, 1, 2]
    it "Union4" $
      [1 ,2, 3] `shouldBe` 1 : 2 : 3 : []
    it "Access" $
      "Steve Buscemi" !! 6 `shouldBe` 'B'
    it "Access2" $
      [1, 2, 3] !! 1 `shouldBe` 2
    it "List in List" $
      [[1, 2, 3], [4, 5]] ++ [[6]] `shouldBe` [[1, 2, 3], [4, 5], [6]] 
    it "List in List2 Failed" $
      [6] : [[1, 2, 3], [4, 5]] `shouldNotBe` [[7], [1, 2, 3], [4, 5]] 
    it "List in List2 Success" $
      [6] : [[1, 2, 3], [4, 5]] `shouldBe` [[6], [1, 2, 3], [4, 5]] 
    it "List in List3" $
      [[6], [1, 2, 3], [4, 5]] !! 2 `shouldBe` [4, 5]
    it "Comparison" $
      [3, 4, 2] < [3, 4, 3] `shouldBe` True
    it "Comparison2" $
      [3, 4, 2] < [3, 4] `shouldBe` False
    it "Comparison3" $
      [1, 2] == [1, 2] `shouldBe` True

