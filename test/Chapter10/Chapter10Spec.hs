module Chapter10.Chapter10Spec (spec) where

import Test.Hspec
import Chapter10.SolveRPN

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "SolveRPN" $ do
        it "001" $
            solveRPN "10 4 3 + 2 * -" `shouldBe` -4
        it "002" $
            solveRPN "2 3.5 +" `shouldBe` 5.5
