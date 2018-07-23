module Chapter9.CoinToss where

import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (coin1, newGen) = random gen
        (coin2, newGen') = random newGen
        (coin3, _) = random newGen'
    in  (coin1, coin2, coin3)
    
