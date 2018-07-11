module Chapter6.Chapter6Spec (spec) where

import Data.Char
import Data.List
import qualified Data.Map as Map
import Test.Hspec
import Control.Exception
import Chapter6.Chapter6
import Chapter6.Geometry

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter6" $ do
    it "numUniques" $
      numUniques [1, 1, 2, 3] `shouldBe` 3
    it "numUniques'" $
      numUniques [1, 1, 2, 3] `shouldBe` numUniques' [1, 1, 2, 3]
    it "words" $
      words "hello world" `shouldBe` ["hello", "world"]
    it "group" $
      group [1, 1, 2, 2, 3] `shouldBe` [[1, 1], [2, 2], [3]]
    it "group and sort" $
      (group $ sort [1, 2, 3, 1, 2]) `shouldBe` [[1, 1], [2, 2], [3]]
    it "wordNums" $
      wordNums "hello world hello world !!" `shouldBe` [("!!", 1), ("hello", 2), ("world", 2)]
    it "isPrefixOf" $
      "hello" `isPrefixOf` "hello world" `shouldBe` True 
    it "isPrefixOf2" $
      "world" `isPrefixOf` "hello world" `shouldBe` False 
    it "isIn" $
      "hello" `isIn` "hello world" `shouldBe` True
    it "isIn2" $
      "world" `isIn` "hello world" `shouldBe` True
    it "isIn3" $
      "aaa" `isIn` "hello world" `shouldBe` False 
    it "ord" $
      ord 'a' `shouldBe` 97
    it "chr" $
      chr 97 `shouldBe` 'a'
    it "encode" $
      encode 2 "hello" `shouldBe` "jgnnq"
    it "decode" $
      decode 2 "jgnnq" `shouldBe` "hello"
    it "digitSum" $
      digitSum 123 `shouldBe` 6
    it "Maybe example" $
      find (> 4) [3, 4, 5, 6] `shouldBe` Just 5
    it "Maybe example2" $
      find (> 10) [3, 4, 5, 6] `shouldBe` Nothing
    it "firstTo40" $
      firstTo40 `shouldBe` Just 49999
    it "firstTo" $
      firstTo 27 `shouldBe` Just 999
    it "findKey" $
      findKey "bonnie" phoneBook `shouldBe` "452-2928"
    it "findKey'" $
      findKey' "bonnie" phoneBook `shouldBe` Just "452-2928"
    it "findKey'2" $
      findKey' "abc" phoneBook `shouldBe` Nothing
    it "findKey''" $
      findKey'' "bonnie" phoneBook `shouldBe` Just "452-2928"
    it "findKey''2" $
      findKey'' "abc" phoneBook `shouldBe` Nothing
    it "fromList" $
      Map.lookup "betty" phoneBook' `shouldBe` (Just . snd $ phoneBook !! 0)
    it "fromList2" $
      Map.lookup "aaa" phoneBook' `shouldBe` Nothing
    it "insert" $
      Map.lookup "grace" (Map.insert "grace" "341-9021" phoneBook') `shouldBe` Just "341-9021"
    it "size" $
      Map.size phoneBook' `shouldBe` 3
    it "string2digits" $
      string2digits "123-456" `shouldBe` [1, 2, 3, 4, 5, 6]
    it "string2digits2" $
      Map.lookup "betty" (Map.map string2digits phoneBook') `shouldBe` Just [5, 5, 5, 2, 9, 3, 8]
    it "phoneBookToMap" $
      (Map.lookup "betty" $ phoneBookToMap phoneBook'') `shouldBe` Just "555-4000, 555-3000, 555-2938"
    it "phoneBookToMap" $
      (Map.lookup "patsy" $ phoneBookToMap phoneBook'') `shouldBe` Just "493-2928"
    it ("phoneBookToMap'") $
      (Map.lookup "betty" $ phoneBookToMap' phoneBook'') `shouldBe` Just ["555-4000", "555-3000", "555-2938"]
    it ("fromListWith") $
      Map.fromListWith max [(2, 3), (2, 5), (3, 5), (3, 2)] `shouldBe` Map.fromList [(2, 5), (3, 5)]
    it ("fromListWith2") $
      Map.fromListWith (+) [(2, 3), (2, 5), (3, 5), (3, 2)] `shouldBe` Map.fromList [(2, 8), (3, 7)]
    it ("sphereVolume") $
      sphereVolume 4 `shouldBe` 268.08258
    it ("sphereArea") $
      sphereArea 2 `shouldBe` 50.265484
    it ("cuboidArea") $
      cubeArea 3.0 `shouldBe` 54.0
    it ("cubeVolume") $
      cubeVolume 3 `shouldBe` 27.0
    it ("cuboidVolume") $
      cuboidVolume 3 2 1 `shouldBe` 6.0
    it ("cuboidArea") $
      cuboidArea 3 2 1 `shouldBe` 22.0
    it ("example") $
      evaluate (1 `div` 0 :: Int) `shouldThrow` anyException
