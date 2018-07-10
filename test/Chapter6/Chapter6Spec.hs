module Chapter6.Chapter6Spec (spec) where

import Data.Char
import Data.List
import Test.Hspec
import Control.Exception (evaluate)
import Chapter6.Chapter6

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter6" $ do
    it "numUniques" $
      numUniques [1, 1, 2, 3] `shouldBe` 3
    it "numUniques'" $
      numUniques [1, 1, 2, 3] `shouldBe` numUniques' [1, 1, 2, 3]
    it "words" $
      words "hello world" `shouldBe` ["hello", "world"]
    it "group" $
      group [1, 1, 2, 2, 3] `shouldBe` [[1, 1], [2, 2], [3]]
    it "group and sort" $
      (group $ sort [1, 2, 3, 1, 2]) `shouldBe` [[1, 1], [2, 2], [3]]
    it "wordNums" $
      wordNums "hello world hello world !!" `shouldBe` [("!!", 1), ("hello", 2), ("world", 2)]
    it "isPrefixOf" $
      "hello" `isPrefixOf` "hello world" `shouldBe` True 
    it "isPrefixOf2" $
      "world" `isPrefixOf` "hello world" `shouldBe` False 
    it "isIn" $
      "hello" `isIn` "hello world" `shouldBe` True
    it "isIn2" $
      "world" `isIn` "hello world" `shouldBe` True
    it "isIn3" $
      "aaa" `isIn` "hello world" `shouldBe` False 
    it "ord" $
      ord 'a' `shouldBe` 97
    it "chr" $
      chr 97 `shouldBe` 'a'
    it "encode" $
      encode 2 "hello" `shouldBe` "jgnnq"
    it "decode" $
      decode 2 "jgnnq" `shouldBe` "hello"
