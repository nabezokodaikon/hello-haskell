module Chapter10.Chapter10Spec (spec) where

import Test.Hspec
import Chapter10.SolveRPN
import Chapter10.Heathrow

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "SolveRPN" $ do
        it "001" $
            solveRPN "10 4 3 + 2 * -" `shouldBe` -4
        it "002" $
            solveRPN "2 3.5 +" `shouldBe` 5.5
        it "/" $
            solveRPN "4 2 /" `shouldBe` 2
        it "^" $
            solveRPN "4 2 ^" `shouldBe` 16
        it "ln" $
            solveRPN "1 2 3 ln" `shouldBe` 1.0986122886681098
        it "sum" $
            solveRPN "1 2 3 sum" `shouldBe` 6
    describe "optimalPath" $ do
        it "Hard coding" $
            optimalPath heathrowToLondon `shouldBe`
            [(B,10),(C,30),(A,5),(C,20),(B,2),(B,8),(C,0)]
