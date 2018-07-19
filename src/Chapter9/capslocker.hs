import Control.Monad
import Data.Char

-- stack runghc src/Chapter9/capslocker.hs < src/Chapter9/haiku.txt

main :: IO ()
main = forever $ do
  l <- getLine
  putStrLn $ map toUpper l
