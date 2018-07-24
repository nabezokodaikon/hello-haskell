module Chapter9.RandomSampleSpec (spec) where

import Test.Hspec
import System.Random
import Chapter9.CoinToss

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "Sample" $ do
        it "Random" $ do
            let (v1, _) = random (mkStdGen 100) :: (Int, StdGen)
                (v2, _) = random (mkStdGen 100) :: (Int, StdGen)
            v1 `shouldBe` v2
        it "Random2" $ do
            let (_, r1) = random (mkStdGen 100) :: (Int, StdGen)
                (_, r2) = random (mkStdGen 100) :: (Int, StdGen)
            show r1 `shouldBe` show r2
        it "Random3" $ do
            let (v1, _) = random (mkStdGen 100) :: (Int, StdGen)
                (v2, _) = random (mkStdGen 101) :: (Int, StdGen)
            v1 `shouldNotBe` v2
        it "Random4" $ do
            let (_, r1) = random (mkStdGen 100) :: (Int, StdGen)
                (_, r2) = random r1 :: (Int, StdGen)
            show r1 `shouldNotBe` show r2
    describe "threeCoins" $ do 
        it "Random" $
            threeCoins (mkStdGen 1) `shouldBe` threeCoins (mkStdGen 1)
        it "Random2" $
            threeCoins (mkStdGen 1) `shouldNotBe` threeCoins (mkStdGen 2)
    describe "Randoms" $ do
        it "randoms'" $
            take 5 (randoms' (mkStdGen 11) :: [Int]) `shouldBe`
            take 5 (randoms (mkStdGen 11) :: [Int])
        it "finiteRandom" $
            fst (finiteRandom 5 (mkStdGen 11) :: ([Int], StdGen)) `shouldBe`
            fst (finiteRandom 5 (mkStdGen 11) :: ([Int], StdGen)) 
    describe "RandomR" $ do
        it "randomR" $
            let n = fst (randomR (1, 6)(mkStdGen 11) :: (Int, StdGen))
             in 1 <= n && n <= 6 `shouldBe` True
        it "randomRs" $
            let c = take 1 (randomRs ('a', 'z') (mkStdGen 11) :: [Char])
             in "a" <= c && c <= "z" `shouldBe` True
