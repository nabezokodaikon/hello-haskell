-- stack runghc src/Chapter11/FmappingIO.hs

module Chapter11.FmappingIO where

import Data.Char
import Data.List

main = do
    line <- fmap (intersperse '-' .reverse . map toUpper) getLine
    putStr line
