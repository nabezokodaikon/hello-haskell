module Chapter8.Helloworld where

{-
-- 8.2
main = putStrLn "hello, world"
-}

-- 8.3
main :: IO ()
main = do
  putStrLn "Hello, what's your name?"
  name <- getLine
  putStrLn ("Hey " ++ name ++ ", you rock!")
