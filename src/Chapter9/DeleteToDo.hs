-- stack runghc src/Chapter9/DeleteToDo.hs

module Chapter9.DeleteToDo where

import System.IO
import System.Directory
import Data.List
import Control.Exception

main :: IO ()
main = do
  let todoFile = "src/Chapter9/todo.txt"

  contents <- readFile todoFile
  let todoTasks = lines contents -- "aaa\nbbb" -> ["aaa", "bbb"]
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks

  putStrLn "These are your TO-DO items:"
  mapM_ putStrLn numberedTasks
  putStrLn "Which one do you want to delete?"

  numberString <- getLine
  let number = read numberString
      newTodoItems = unlines $ delete (todoTasks !! number) todoTasks -- ["aaa", "bbb"] -> "aaa\nbbb\n"

  bracketOnError (openTempFile "." "temp")
    (\(tempName, tempHandle) -> do
        hClose tempHandle
        removeFile tempName)
    
    (\(tempName, tempHandle) -> do
        hPutStr tempHandle newTodoItems
        hClose tempHandle
        removeFile todoFile
        renameFile tempName todoFile)
