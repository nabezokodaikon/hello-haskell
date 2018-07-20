-- stack runghc src/Chapter9/BaaBaaCaps.hs

module Chapter9.BaaBaaCaps where

import Data.Char
import System.IO

main = do
  contents <- readFile "src/Chapter9/baabaa.txt"
  writeFile "src/Chapter9/baabaacaps.txt" (map toUpper contents)
