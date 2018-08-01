module Chapter13.Chapter13Spec (spec) where

import Test.Hspec
import Chapter13.Chapter13


main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "13.2 Maybeから始めるモナド" $ do
        it "fmap Maybe" $
            fmap (++"!") (Just "wisdom") `shouldBe` Just "wisdom!"
        it "fmap Maybe 2" $
            fmap (++"!") Nothing `shouldBe` Nothing
        it "<*> Maybe" $
            Just (+3) <*> Just 3 `shouldBe` Just 6
        it "<$> Maybe" $
            max <$> Just 3 <*> Just 6 `shouldBe` Just 6
        it "applyMaybe" $
            Just 3 `applyMaybe` (\x -> Just (x + 1)) `shouldBe` Just 4
        it "applyMaybe 2" $
            Just "smile" `applyMaybe` (\x -> Just (x ++ " :)")) `shouldBe` Just "smile :)"
        it "applyMaybe 3" $
            Nothing `applyMaybe` (\x -> Just (x + 1)) `shouldBe` Nothing
        it "applyMaybe 4" $
            Just 3 `applyMaybe` (\x -> if x > 2 then Just x else Nothing) `shouldBe` Just 3
        it "applyMaybe 5" $
            Just 1 `applyMaybe` (\x -> if x > 2 then Just x else Nothing) `shouldBe` Nothing
    describe "13.3 Monad型クラス" $ do
        it "Monad Maybe" $
            (return "WHAT" :: Maybe String) `shouldBe` Just "WHAT"
        it "Monad Maybe 2" $
            (Just 9 >>= \x -> return (x * 10)) `shouldBe` Just 90
        it "Monad Maybe 3" $
            (Nothing >>= \x -> return (x * 10)) `shouldBe` Nothing
