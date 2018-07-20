-- stack runghc src/Chapter9/Shortlinesonly.hs < src/Chapter9/shortlines.txt

module Chapter9.Shortlinesonly where

main :: IO ()
{- main = do -}
  {- contents <- getContents -}
  {- putStr (shortLinesOnly contents) -}
main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line -> length line < 10) . lines
-- shortLinesOnly txt = unlines (filter (\line -> length line < 10) (lines txt))
