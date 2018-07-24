module Chapter9.CoinToss where

import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (coin1, newGen) = random gen
        (coin2, newGen') = random newGen
        (coin3, _) = random newGen'
    in  (coin1, coin2, coin3)

randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen
               in value : randoms' newGen

finiteRandom :: (RandomGen g, Random a, Num n, Eq n) => n -> g -> ([a], g)
finiteRandom 0 gen = ([], gen)
finiteRandom n gen =
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandom (n - 1) newGen
    in  (value : restOfList, finalGen)
