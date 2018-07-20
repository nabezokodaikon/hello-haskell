-- stack runghc src/Chapter9/BaaBaa.hs

module Chapter9.BaaBaa where

import Control.Exception
import System.IO

{-
main :: IO ()
main = do
  handle <- openFile "src/Chapter9/baabaa.txt" ReadMode
  contents <- hGetContents handle
  putStr contents
  hClose handle
-}

{-
main :: IO ()
main = withFile "src/Chapter9/baabaa.txt" ReadMode $ \handle -> do
  contents <- hGetContents handle
  putStr contents
-}

main = do
  contents <- readFile "src/Chapter9/baabaa.txt"
  putStr contents

withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' name mode f = bracket (openFile name mode)
  (\handle -> hClose handle)
  (\handle -> f handle)
