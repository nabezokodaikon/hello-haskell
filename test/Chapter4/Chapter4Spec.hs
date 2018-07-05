module Chapter4.Chapter4Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter4.Chapter4

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter4" $ do
    it "maximum'" $
      maximum' [1, 5, 3] `shouldBe` 5
    it "maximum'2" $
      maximum' [1] `shouldBe` 1
    {- TODO: replでは実行できた。
    it "maximum'3" $
      evaluate (maximum' []) `shouldThrow` anyException
    -}
    it "replicate'" $
      replicate' 3 "abc" `shouldBe` ["abc", "abc", "abc"]
    it "replicate'2" $
      replicate' 0 "abc" `shouldBe` []
    it "take'" $
      take 3 [5, 4, 3, 2, 1] `shouldBe` [5, 4, 3]
    it "reverse'" $
      reverse [1, 2, 3] `shouldBe` [3, 2, 1]
    it "repeat'" $
      take' 3 (repeat' 5) `shouldBe` [5, 5, 5]
    {- TODO: 空リストの比較。
    it "zip'" $
      zip' [] [1, 2, 3] `shouldBe` []
    it "zip'2" $
      zip' [1, 2, 3] [] `shouldBe` []
    -}
    it "zip'3" $
      zip' [1, 2, 3] [4, 5, 6] `shouldBe` [(1, 4), (2, 5), (3, 6)]
    it "zip'4" $
      zip' [1, 2, 3, 4] [4, 5, 6] `shouldBe` [(1, 4), (2, 5), (3, 6)]
    it "zip'5" $
      zip' [1, 2, 3] [4, 5, 6, 7] `shouldBe` [(1, 4), (2, 5), (3, 6)]
    it "elem'" $
      elem 1 [] `shouldBe` False
    it "elem'2" $
      elem 1 [2, 3] `shouldBe` False
    it "elem'3" $
      elem 3 [2, 3] `shouldBe` True
