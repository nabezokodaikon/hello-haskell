module Chapter9.RandomString where

import System.Random

main :: IO ()
main = do
    gen <- getStdGen
    putStrLn $ take 20 (randomRs ('a', 'z') gen)
    gen2 <- getStdGen
    putStrLn $ take 20 (randomRs ('a', 'z') gen2) -- 同じ値が出力される。
    gen' <- newStdGen
    putStrLn $ take 20 (randomRs ('a', 'z') gen') -- 異なる値が出力される。

