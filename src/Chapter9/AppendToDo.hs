-- stack runghc src/Chapter9/AppendToDo.hs

module Chapter9.AppendToDo where

import System.IO

main :: IO ()
main = do
  todoItem <- getLine
  appendFile "src/Chapter9/todo.txt" (todoItem ++ "\n")
