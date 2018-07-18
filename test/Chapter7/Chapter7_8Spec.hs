module Chapter7.Chapter8_7Spec (spec) where

import Test.Hspec
import Chapter7.Chapter7_8

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7_8 交通信号データ型" $ do
    it "Eq" $
      Red == Red `shouldBe` True
    it "Eq 2" $
      Red == Yellow `shouldBe` False
    it "elem" $
      Red `elem` [Red, Yellow, Green] `shouldBe` True
    it "show" $
      show Red `shouldBe` "Red light"
    {- it "show 2" $ -}
      {- [Red, Yellow, Green] `shouldBe` ["Red light", "Yellow light", "Green light"] -}
  describe "YesとNoの型クラス" $ do
    it "yesno" $
      (yesno $ length []) `shouldBe` False
    it "yesno 2" $
      yesno "haha" `shouldBe` True
    it "yesno 3" $
      yesno "" `shouldBe` False
    it "yesno 4" $
      yesno (Just 0) `shouldBe` True
    it "yesno 5" $
      yesno True `shouldBe` True
    it "yesno 6" $
      yesno EmptyTree `shouldBe` False
    it "yesno 7" $
      yesno [] `shouldBe` False
    it "yesno 8" $
      yesno [0, 0, 0] `shouldBe` True
    it "yesnoIf" $
      yesnoIf [] "Yes" "No" `shouldBe` "No"
    it "yesnoIf 2" $
      yesnoIf [2, 3, 4] "Yes" "No" `shouldBe` "Yes"
    it "yesnoIf 3" $
      yesnoIf True "Yes" "No" `shouldBe` "Yes"
    it "yesnoIf 4" $
      yesnoIf (Just 500) "Yes" "No" `shouldBe` "Yes"
    it "yesnoIf 5" $
      yesnoIf Nothing "Yes" "No" `shouldBe` "No"
  describe "Functor型クラス" $ do
    it "fmap" $
      fmap (* 2) [1, 2] `shouldBe` map (* 2) [1, 2]
    it "fmap 2" $
      fmap (* 2) [] `shouldBe` map (* 2) []
  describe "MaybeはFunctorだよ、たぶん" $ do
    it "Maybe" $
      fmap (++ "A") (Just "B") `shouldBe` Just "BA"
    it "Maybe 2" $
      fmap (++ "A") Nothing `shouldBe` Nothing
    it "Maybe 3" $
      fmap (* 2) (Just 200) `shouldBe` Just 400
    it "Maybe 4" $
      fmap (* 2) Nothing `shouldBe` Nothing
    describe "TreeもFunctorの森に" $ do
      it "Tree" $
        fmap (* 2) EmptyTree `shouldBe` EmptyTree
      it "Tree 2" $
        fmap (* 4) (foldr treeInsert EmptyTree [5, 7, 3]) `shouldBe`
        Node 12 EmptyTree (Node 28 (Node 20 EmptyTree EmptyTree) EmptyTree)
