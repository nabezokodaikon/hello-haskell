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
