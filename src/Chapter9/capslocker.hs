-- stack runghc src/Chapter9/Capslocker.hs < src/Chapter9/haiku.txt

module Chapter9.Capslocker where

import Control.Monad
import Data.Char

main :: IO ()
main = forever $ do
  l <- getLine
  putStrLn $ map toUpper l
