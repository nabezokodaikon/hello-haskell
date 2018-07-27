module Chapter11.Chapter11Spec (spec) where

import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "" $ do
        it "" $
