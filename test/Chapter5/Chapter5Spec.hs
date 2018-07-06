module Chapter4.Chapter4Spec (spec) where

import Test.Hspec
import Control.Exception (evaluate)
import Chapter5.Chapter5

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Chapter5" $ do
    it "max" $
      max 4 5 `shouldBe` (max 4) 5
    it "multThree" $
      multThree 3 5 9 `shouldBe` ((multThree 3) 5) 9
    it "compareWithHundred" $
      compareWithHundred 99 `shouldBe` GT
    it "compareWithHundred2" $
      compareWithHundred 99 `shouldBe` compareWithHundred' 99
    it "divideByTen" $
      divideByTen 200 `shouldBe` 200 / 10
    it "isUpperAlphanum" $
      isUpperAlphanum 'a' `shouldBe` False
    it "minusFour" $
      minusFour 3 `shouldBe` -1
    it "applyTwice" $
      applyTwice (+3) 10 `shouldBe` 16
    it "applyTwice2" $
      applyTwice (multThree 2 2) 9 `shouldBe` 144
    it "applyTwice3" $
      applyTwice (3 :) [1] `shouldBe` [3, 3, 1]
    it "zipWith'" $
      zipWith' (+) [1, 2, 3] [4, 5, 6] `shouldBe` [5, 7, 9]
    it "zipWith'2" $
      zipWith' max [1, 2, 3] [4, 5, 6] `shouldBe` [4, 5, 6]
    it "zipWith'3" $
      zipWith' (*) (replicate 5 2) [1..] `shouldBe` [2, 4, 6, 8, 10]
    it "zipWith'4" $
      zipWith' (zipWith' (*)) [[1, 2, 3], [4, 5, 6]] [[7, 8, 9], [0, 1, 2]] `shouldBe`
      [[7, 16, 27], [0, 5, 12]]
    it "zip" $
      zip [1, 2, 3] "abc" `shouldBe` [(1, 'a'), (2, 'b'), (3, 'c')]
    it "flip'" $
      flip' zip [1, 2, 3] "abc" `shouldBe` [('a', 1), ('b', 2), ('c', 3)]
    it "flip'2" $
      flip' zip [1, 2, 3, 4, 5] "hello" `shouldBe` flip'' zip [1, 2, 3, 4, 5] "hello"
    it "zipWith with div" $
      zipWith div [2, 2..] [10, 8, 6, 4, 2] `shouldBe` [0, 0, 0, 0, 1]
    it "zipWith with flip div" $
      zipWith (flip' div) [2, 2..] [10, 8, 6, 4, 2] `shouldBe` [5, 4, 3, 2, 1]
    it "map'" $
      map' (+3) [1, 2, 3] `shouldBe` [4, 5, 6]
    it "map'2" $
      map' (replicate 3) [3..5] `shouldBe` [[3, 3, 3], [4, 4, 4], [5, 5, 5]]
    it "map'3" $
      map' (map' (^2)) [[1, 2], [3, 4]] `shouldBe` [[1, 4], [9, 16]]
    it "map'4" $
      map' fst [(1, 2), (3, 4)] `shouldBe` [1, 3]
    it "filter'" $
      filter' (> 3) [1, 2, 3, 4, 5] `shouldBe` [4, 5]
    it "filter'2" $
      filter' (== 3) [1, 2, 3, 4, 5] `shouldBe` [3]
    it "filter'3" $
      filter' (`elem` ['a'..'z']) "Hello!" `shouldBe` "ello"
    it "filter'4" $
      filter' (\x -> x < 15 && odd x) [1, 2, 3, 14, 15, 16] `shouldBe` [1, 3]
    it "filter'5" $
      filter' (odd) (filter' (< 15) [1, 2, 3, 14, 15, 16]) `shouldBe` [1, 3]
    it "largestDivisible" $
      largestDivisible 10 4 `shouldBe` 8
    it "takeWhile Example" $
      takeWhile (/= ' ') "Hello World!" `shouldBe` "Hello"
    it "takeWhile Example2" $
      sum (takeWhile (< 10 ^ 2) (filter odd (map (^2) [1..]))) `shouldBe` 1 + 9 + 25 + 49 + 81
    it "takeWhile Example3" $
      sum (takeWhile (< 10 ^ 2) [m | m <- [n ^ 2 | n <- [1..]], odd m]) `shouldBe` 165
    it "chain" $
      chain 3 `shouldBe` [3, 10, 5, 16, 8, 4, 2, 1]
    it "numLogChains" $
      numLogChains `shouldBe` numLogChains'
