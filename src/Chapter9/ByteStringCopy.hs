-- stack runghc src/Chapter9/ByteStringCopy.hs src/Chapter9/source.txt src/Chapter9/dest.txt

module Chapter9.ByteStringCopy where

import System.Environment
import System.Directory
import System.IO
import Control.Exception
import qualified Data.ByteString.Lazy as B

main :: IO ()
main = do
    (fileName1 : fileName2 : _) <- getArgs
    copy fileName1 fileName2

copy source dest = do
    contents <- B.readFile source
    bracketOnError
        (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)
        (\(tempName, tempHandle) -> do
            B.hPutStr tempHandle contents
            hClose tempHandle
            renameFile tempName dest)
