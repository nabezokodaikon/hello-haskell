-- stack runghc src/Chapter9/shortlinesonly.hs < src/Chapter9/shortlines.txt

main :: IO ()
main = do
  contents <- getContents
  putStr (shortLinesOnly contents)

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line -> length line < 10) . lines
-- shortLinesOnly txt = unlines (filter (\line -> length line < 10) (lines txt))
