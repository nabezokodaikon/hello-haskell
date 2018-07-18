module Chapter8.Helloworld where

import Data.Char

-- 8.2
{-
main = putStrLn "hello, world"
-}

-- 8.3
{-
main :: IO ()
main = do
  putStrLn "Hello, what's your name?"
  name <- getLine
  putStrLn ("Hey " ++ name ++ ", you rock!")
-}

-- I/Oアクションの中でletを使う
{-
main :: IO ()
main = do
  putStrLn "What's your first name?"
  firstName <- getLine
  putStrLn "What's your last name?"
  lastName <- getLine
  let bigFirstName = map toUpper firstName
      bigLastName = map toUpper lastName
  putStrLn $ "hey " ++ bigFirstName ++ " "
                    ++ bigLastName
                    ++ ", how are you?"
-}

-- 逆順に表示する
main :: IO ()
main = do
  line <- getLine
  if null line
     then return ()
     else do
       putStrLn $ reverseWords line
       main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
{- reverseWords line = unwords (map reverse (words line)) -}
