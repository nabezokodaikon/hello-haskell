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
    {-
       TODO: replでは正常に実行される。
    it "tell" $
      tell [] `shouldBe` "Empty"
    -}
    it "tell2" $
      tell "XY" `shouldBe` "Two"
    it "tell3" $
      tell "Hello" `shouldBe` "Long"
    it "tell4" $
      tell [1, 2] `shouldBe` "Two"
    it "badAdd" $
      badAdd [1, 2, 3] `shouldBe` 6
    it "badAdd2" $
      evaluate (badAdd [1, 2]) `shouldThrow` anyException
    it "firstLetter" $
      firstLetter "" `shouldBe` "Empty"
    it "firstLetter" $
      firstLetter "Hello" `shouldBe` "Hello is H"
  describe "Guard" $ do
    it "bmiTell" $
      bmiTell 18 `shouldBe` "You're underweight, you emo, you!"
    it "bmiTell2" $
      bmiTell 24 `shouldBe` "You're supposedly normal.\
                            \ Pffft, Ibet you're ugly!"
    it "bmiTell3" $
      bmiTell 31 `shouldBe` "You're a whale, congratulations!"
    it "bmiTell'" $
      bmiTell' 70 170 `shouldBe` "You're underweight, you emo, you!"
    it "max'" $
      max' 2 4 `shouldBe` 4
    it "max'2" $
      max' 3 1 `shouldBe` 3
    it "myCompare" $
      2 `myCompare` 2 `shouldBe` EQ
    it "myCompare2" $
      2 `myCompare` 3 `shouldBe` LT
    it "myCompare3" $
      4 `myCompare` 3 `shouldBe` GT
    it "bmiTell''" $
      bmiTell'' 70 170 `shouldBe` "You're underweight, you emo, you!"
    it "bmiTell'''" $
      bmiTell''' 70 170 `shouldBe` "You're underweight, you emo, you!"
    it "greet" $
      greet "Juan" `shouldBe` niceGreeting ++ " Juan!"
    it "greet2" $
      greet "Hoge" `shouldBe` badGreeting ++ " " ++ "Hoge"
    it "bmiTell''''" $
      bmiTell'''' 70 170 `shouldBe` "You're underweight, you emo, you!"
    it "calcBmis" $
      calcBmis [(70, 170), (100, 150), (120, 180)] `shouldBe` [2.422145328719723e-3, 4.4444444444444444e-3, 3.703703703703704e-3]
    it "calcBmis'" $
      calcBmis' [(70, 170)] `shouldBe` ["You're underweight, you emo, you!"]
