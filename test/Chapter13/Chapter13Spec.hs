module Chapter13.Chapter13Spec (spec) where

import Test.Hspec
import Control.Monad
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
    describe "13.4 綱渡り" $ do
        -- it "Pole 1" $
            -- landLeft 2 (landRight 1 (landLeft 1 (0, 0))) `shouldBe` (3, 1)
        -- it "-: 1" $
            -- 100 -: (* 3) `shouldBe` 300
        -- it "-: 2" $
            -- True -: not `shouldBe` False
        -- it "Pole 2" $
            -- (0, 0) -: landLeft 2 `shouldBe` (2, 0)
        -- it "Pole 3" $
            -- (0, 0) -: landLeft 1 -: landRight 1 -: landLeft 2 `shouldBe` (3, 1)
        it "Pole Maybe" $
            landLeft 2 (0, 0) `shouldBe` Just (2, 0)
        it "Pole Maybe" $
            landLeft 10 (0, 3) `shouldBe` Nothing
        it "Pole >>=" $
            (landRight 1 (0, 0) >>= landLeft 2) `shouldBe` Just (2, 1) 
        it "Pole >>= 2" $
            (Nothing >>= landLeft 2) `shouldBe` Nothing
        it "Pole >>= 3" $
            (return (0, 0) >>= landRight 2 >>= landLeft 2 >>= landRight 2) `shouldBe`
            Just (2, 4)
        it "Pole >>= 4" $
            (return (0, 0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)) `shouldBe`
            Nothing
        it "banana" $
            (return (0, 0) >>= landLeft 1 >>= banana >>= landRight 1) `shouldBe`
            Nothing
    describe "13.5 do記法" $ do
        it "do" $
            foo `shouldBe` foo'
        it "do 2" $
            marySue `shouldBe` marySue'
        it "justH" $
            justH `shouldBe` Just 'h'
        it "wopwop" $
            wopwop `shouldBe` Nothing
    describe "13.6 リストモナド" $ do
        it ">>=" $
            ([3, 4, 5] >>= \x -> [x, -x]) `shouldBe` [3, -3, 4, -4, 5, -5]
        it ">>= 2" $
            ([] >>= \x -> ["bad", "mad", "rad"]) `shouldBe` []
        it "listOfTuples" $
            ([1, 2] >>= \n -> ['a', 'b'] >>= \ch -> return (n, ch)) `shouldBe`
            [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]
        it "listOfTuples 2" $
            listOfTuples `shouldBe` 
            [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]
        it "guard" $
            (guard (5 > 2) :: Maybe ()) `shouldBe` Just ()
        it "guard 2" $
            (guard (1 > 2) :: Maybe ()) `shouldBe` Nothing
        it "guard 3" $
            (guard (5 > 2) :: [()]) `shouldBe` [()]
        it "guard 4" $
            (guard (1 > 2) :: [()]) `shouldBe` []
        it "guard 5" $
            ([1..50] >>= (\x -> guard ('7' `elem` show x) >> return x)) `shouldBe`
            [7, 17, 27, 37, 47]
        it "guard 6" $
            (guard (5 > 2) >> return "cool" :: [String]) `shouldBe`
            ["cool"]
        it "guard 7" $
            (guard (1 > 2) >> return "cool" :: [String]) `shouldBe`
            []
        it "sevensOnly" $
            sevensOnly `shouldBe`
            [7, 17, 27, 37, 47]
        it "moveKnight" $
            moveKnight (8, 1) `shouldBe` [(6, 2), (7, 3)]
        it "canReachIn3" $
            (6, 2) `canReachIn3` (6, 1) `shouldBe` True
