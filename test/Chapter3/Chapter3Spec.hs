module Chapter3.Chapter3Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter3.Chapter3

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Pattern match" $ do
    it "lucky" $
      lucky 7 `shouldBe` "Is 7"
    it "lucky2" $
      lucky 1 `shouldBe` "Is not 7"
    it "sayMe" $
      sayMe 2 `shouldBe` "Two"
    it "sayMe2" $
      sayMe 4 `shouldBe` "Not between 1 and 3"
    it "factorial" $
      factorial 0 `shouldBe` 1
    it "factorial2" $
      factorial 3 `shouldBe` 1 * 2 * 3
    it "charName" $
      charName 'a' `shouldBe` "Albert"
    it "charName2" $
      evaluate (charName 'c') `shouldThrow` anyException
    it "addVectors" $
      addVectors (1, 2) (3, 4) `shouldBe` (4, 6)
    it "first" $
      first (1, 2, 3) `shouldBe` 1
    it "second" $
      second (1, 2, 3) `shouldBe` 2
    it "third" $
      third (1, 2, 3) `shouldBe` 3
    it "listMatch" $
      listMatch [(1, 2), (3, 4)] `shouldBe` [3, 7]
    it "head'" $
      head [1, 2, 3] `shouldBe` 1
    it "head'2" $
      head "Hello" `shouldBe` 'H'
    it "head'3" $
      evaluate (head' []) `shouldThrow` anyException
    it "tell" $
      tell [] `shouldBe` "Empty"
    it "tell2" $
      tell "XY" `shouldBe` "Two"
    it "tell3" $
      tell "Hello" `shouldBe` "Long"
    it "badAdd" $
      badAdd [1, 2, 3] `shouldBe` 6
    it "badAdd2" $
      evaluate (badAdd [1, 2]) `shouldThrow` anyException
    it "firstLetter" $
      firstLetter "" `shouldBe` "Empty"
    it "firstLetter" $
      firstLetter "Hello" `shouldBe` "Hello is H"
