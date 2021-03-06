module Chapter7.Chapter7_7Spec (spec) where

import Test.Hspec
import Chapter7.Chapter7_7

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter7_7" $ do
    it "List Example" $
      [5] `shouldBe` 5:[]
    it "List Example2" $
      [4, 5] `shouldBe` 4:(5:[])
    it "List Example3" $
      [3, 4, 5] `shouldBe` 3:(4:(5:[]))
    it "List Example4" $
      [3, 4, 5] `shouldBe` 3:4:5:[]
    it "MyList" $
      5 `Cons` MyEmpty `shouldBe` Cons 5 MyEmpty
    it "MyList2" $
      4 `Cons` (5 `Cons` MyEmpty) `shouldBe` Cons 4 (Cons 5 MyEmpty)
  describe "リストの改善" $ do
    it "List" $
      3 :-: 4 :-: 5 :-: Empty `shouldBe` 3 :-: (4 :-: (5 :-: Empty))
    it "^++" $
      (3 :-: 4 :-: Empty) ^++ (5 :-: 6 :-: Empty) `shouldBe` 3 :-: (4 :-: (5 :-: (6 :-: Empty)))
  describe "木を植えよう" $ do
    it "myTree" $
      myTree `shouldBe` Node 5
                          (Node 3
                            (Node 1 EmptyTree EmptyTree)
                            (Node 4 EmptyTree EmptyTree) 
                          )
                          (Node 7
                            (Node 6 EmptyTree EmptyTree)
                            (Node 8 EmptyTree EmptyTree) 
                          )
    it "treeElem" $
      8 `treeElem` myTree `shouldBe` True
    it "treeElem 2" $
      10 `treeElem` myTree `shouldBe` False
