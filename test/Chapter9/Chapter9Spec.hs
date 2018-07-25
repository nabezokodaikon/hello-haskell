module Chapter9.Chapter9Spec (spec) where

import Test.Hspec
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "ByteString" $ do
        it "pack" $ do
            show (B.pack [97 .. 99]) `shouldBe` "\"abc\"" 
        it "unpack" $ do
            let p = B.pack [97 .. 99]
                u = B.unpack p
            u `shouldBe` [97 .. 99]
        it "fromChunks" $ do
            show 
                (B.fromChunks [S.pack [40 .. 42], S.pack [43 .. 45], S.pack [46 .. 48]])
            `shouldBe`
                "\"()*+,-./0\""
        it "cons" $
            show (B.cons 97 (B.pack [98, 99])) `shouldBe` "\"abc\""
