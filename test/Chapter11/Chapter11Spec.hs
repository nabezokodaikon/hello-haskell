module Chapter11.Chapter11Spec (spec) where

import Test.Hspec
import Control.Applicative
import Chapter11.Chapter11

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
    describe "Functor 11.2" $ do
        it "id" $
            fmap id (Just 3) `shouldBe` Just 3
        it "id 2" $
            fmap id [1..5] `shouldBe` id [1..5]
        it "CMaybe" $
            CJust 0 "a" `shouldBe` CJust 0 "a"
        it "CMaybe 2" $
            CJust 100 [1..3] `shouldBe` CJust 100 [1, 2, 3]
        it "CMaybe Functor" $
            fmap id (CJust 0 "a") `shouldNotBe` id (CJust 0 "a")
    describe "Applicative Functor" $ do
        it "001" $ do
            let a = fmap (*) [1..4]
            fmap (\f -> f 9) a `shouldBe` [9, 18, 27, 36]
            fmap (\f -> f 9) a `shouldBe` fmap ($9) a
    describe "Applicative Maybe" $ do
        it "001" $
            Just (+3) <*> Just 9 `shouldBe` Just 12
        it "002" $
            pure (+3) <*> Just 10 `shouldBe` Just 13
        it "003" $
            Just (++"abc") <*> Nothing `shouldBe` Nothing
        {- it "004" $ -}
            {- Nothing <*> Just "abc" `shouldBe` Nothing -}
    describe "Applicative style" $ do
        it "001" $
            pure (+) <*> Just 3 <*> Just 5 `shouldBe` Just 8
        it "002" $
            (++) <$> Just "abc" <*> Just "def" `shouldBe` Just "abcdef"
    describe "List" $ do
        it "001" $
            (pure "abc" :: [String]) `shouldBe` ["abc"]
        it "002" $
            (pure "abc" :: Maybe String) `shouldBe` Just "abc"
        it "003" $
            [(*0), (+100), (^2)] <*> [1, 2, 3] `shouldBe`
            [0, 0, 0, 101, 102, 103, 1, 4, 9]
        it "004" $
            [(+), (*)] <*> [1, 2] <*> [3, 4] `shouldBe`
            [4, 5, 5, 6, 3, 4, 6, 8]
        it "005" $
            [ x * y | x <- [2, 5, 10], y <- [8, 10, 11]] `shouldBe`
            (*) <$> [2, 5, 10] <*> [8, 10, 11]
        it "006" $
            (filter (> 50) $ (*) <$> [2, 5, 10] <*> [8, 10, 11]) `shouldBe` [55, 80, 100, 110]
    -- describe "Applicative Function" $
        -- it "001" $
            -- (+) <$> (+3) <*> (*100) (5) `shouldBe` 508
    describe "ZipList" $ do
        it "001" $
            getZipList ((+) <$> ZipList [1, 2, 3] <*> ZipList [100, 100, 100]) `shouldBe`
            [101, 102, 103]
