-- stack runghc src/Chapter9/Palindrome.hs < src/Chapter9/words.txt

module Chapter9.Palindrome where

respondPalindromes :: String -> String
respondPalindromes = 
  unlines .
  map (\xs -> if isPal xs then "palindrome" else "not a palindrome") .
  lines

isPal :: String -> Bool
isPal xs = xs == reverse xs

main :: IO ()
main = interact respondPalindromes
