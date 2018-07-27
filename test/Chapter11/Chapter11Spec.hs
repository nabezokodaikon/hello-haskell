module Chapter11.Chapter11Spec (spec) where

import Test.Hspec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "Functor 11.1" $ do
        it "fmap List" $
            fmap (*2) [1..3] `shouldBe` map (*2) [1..3]
        it "fmap Maybe" $
            fmap (++"a") (Just "b") `shouldBe` Just "ba"
        it "fmap Either Right" $
            fmap (read) (Right "1") `shouldBe` (Right 1 :: Either String Int)
        it "fmap Either Left" $
            fmap (read) (Left "b") `shouldBe` (Left "b" :: Either String Int)
        it "fmap" $ do
            let shout = fmap (++"!")
            shout ["a", "b"] `shouldBe` ["a!", "b!"]
        it "fmap 2" $
            fmap (replicate 3) [1, 2] `shouldBe` [[1, 1, 1], [2, 2, 2]]
        it "fmap 3" $
            fmap (replicate 3) (Just 1) `shouldBe` Just [1, 1, 1]
        it "fmap 4" $
            fmap (replicate 3) (Right 1) `shouldBe`
            (Right [1, 1, 1] :: Either [Int] [Int])
        it "fmap 5" $
            fmap (replicate 3) (Right "abc") `shouldBe`
            (Right ["abc","abc","abc"] :: Either [[Char]] [[Char]])
        it "fmap 6" $
            fmap (replicate 3) Nothing `shouldBe` (Nothing :: Maybe [Bool]) 
        it "fmap 7" $
            fmap (replicate 3) (Left "foo") `shouldBe` (Left "foo" :: Either [Char] [[Char]])
