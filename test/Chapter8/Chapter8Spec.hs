module Chapter8.Chapter8Spec (spec) where

import Test.Hspec
import Chapter8.Chapter8
import qualified Chapter8.Helloworld as HW 

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "8.2 Hello, World!" $ do
    it "Hello, World!" $
      HW.main `shouldReturn` ()
