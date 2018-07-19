import Data.Char

-- stack runghc src/Chapter9/capslocker2.hs < src/Chapter9/haiku.txt

main :: IO ()
main = do
  contents <- getContents
  putStr $ map toUpper contents
