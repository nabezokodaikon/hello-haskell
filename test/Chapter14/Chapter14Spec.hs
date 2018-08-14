module Chapter14.Chapter14Spec (spec) where

import Test.Hspec
import Chapter14.Chapter14

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "14.3 計算の状態の正体" $ do
        it "stackManip" $
           stackManip [5, 8, 2, 1] `shouldBe` (5, [8, 2, 1]) 
