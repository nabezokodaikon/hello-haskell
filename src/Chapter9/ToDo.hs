-- stack runghc src/Chapter9/ToDo.hs add src/Chapter9/todo.txt "aaa"
-- stack runghc src/Chapter9/ToDo.hs view src/Chapter9/todo.txt
-- stack runghc src/Chapter9/ToDo.hs remove src/Chapter9/todo.txt 2

module Chapter9.ToDo where

import System.Environment
import System.Directory
import System.IO
import Data.List
import Control.Exception

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")


view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
    putStr $ unlines numberedTasks


remove :: [String] -> IO ()
remove [fileName, numberString] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks

    putStrLn "These are your TO-DO  items:"
    mapM_ putStrLn numberedTasks

    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks

    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)

        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile fileName
            renameFile tempName fileName)


dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove


main :: IO ()
main = do
  (command : argList) <- getArgs -- 最初の引数をcommandに、残りの引数をargListに束縛する。
  dispatch command argList
