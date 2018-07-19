-- stack runghc src/Chapter9/baabaa.hs

import System.IO

{-
main :: IO ()
main = do
  handle <- openFile "src/Chapter9/baabaa.txt" ReadMode
  contents <- hGetContents handle
  putStr contents
  hClose handle
-}

main :: IO ()
main = withFile "src/Chapter9/baabaa.txt" ReadMode $ \handle -> do
  contents <- hGetContents handle
  putStr contents
