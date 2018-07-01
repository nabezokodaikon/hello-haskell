module Chapter1.BabySpec (spec) where

import Test.Hspec
import Chapter1.Baby

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "doubleMe" $ do
    it "Success" $
      doubleMe 2 `shouldBe` 4
  describe "doubleUs" $ do
    it "Success" $
      doubleUs 2 3 `shouldBe` 10
  describe "doubleSmallNumber" $ do
    it "Success" $
      doubleSmallNumber 2 `shouldBe` 4
    it "Success2" $
      doubleSmallNumber 101 `shouldBe` 101
  describe "doubleSmallNumber'" $ do
    it "Success" $
      doubleSmallNumber' 2 `shouldBe` 5
  describe "conanO'Brien" $ do
    it "Success" $
      conanO'Brien `shouldBe` "It's a=me, Conan O'Brien!"
  describe "List" $ do
    it "Union" $
      [1, 2, 3, 4] ++ [9, 10, 11, 12] `shouldBe` [1, 2, 3, 4, 9, 10, 11, 12]
    it "Union2" $
      'A' : " SMALL CAT" `shouldBe` "A SMALL CAT"
    it "Union3" $
      5: [1, 2] `shouldBe` [5, 1, 2]
    it "Union4" $
      [1 ,2, 3] `shouldBe` 1 : 2 : 3 : []
    it "Access" $
      "Steve Buscemi" !! 6 `shouldBe` 'B'
    it "Access2" $
      [1, 2, 3] !! 1 `shouldBe` 2
    it "List in List" $
      [[1, 2, 3], [4, 5]] ++ [[6]] `shouldBe` [[1, 2, 3], [4, 5], [6]] 
    it "List in List2 Failed" $
      [6] : [[1, 2, 3], [4, 5]] `shouldNotBe` [[7], [1, 2, 3], [4, 5]] 
    it "List in List2 Success" $
      [6] : [[1, 2, 3], [4, 5]] `shouldBe` [[6], [1, 2, 3], [4, 5]] 
    it "List in List3" $
      [[6], [1, 2, 3], [4, 5]] !! 2 `shouldBe` [4, 5]
    it "Comparison" $
      [3, 4, 2] < [3, 4, 3] `shouldBe` True
    it "Comparison2" $
      [3, 4, 2] < [3, 4] `shouldBe` False
    it "Comparison3" $
      [1, 2] == [1, 2] `shouldBe` True
    it "head" $
      head [3, 2, 1] `shouldBe` 3
    it "tail" $
      tail [3, 2, 1] `shouldBe` [2, 1]
    it "last" $
      last [3, 2, 1] `shouldBe` 1
    it "init" $
      init [3, 2, 1] `shouldBe` [3, 2]
    it "head error" $
      head [] `shouldThrow` anyException
    it "length" $
      length [1, 2, 4] `shouldBe` 3
    it "null" $
      null [] `shouldBe` True
    it "not null" $
      null [1, 2] `shouldBe` False
    it "reverse" $
      reverse [1, 2, 3] `shouldBe` [3, 2, 1]
    it "take" $
      take 3 [5, 4, 3, 2, 1] `shouldBe` [5, 4, 3]
    it "take2" $
      take 5 [5, 4, 3] `shouldBe` [5, 4, 3]
    {-
     - replでは正常だが、テストコードではエラーになる。
     - 配列の型が必要？
    it "take3" $
      take 5 [] `shouldBe` []
    -}
    it "take4" $
      take 0 [6, 4, 2] `shouldBe` []
    it "drop" $
      drop 2 [1, 2, 3, 4] `shouldBe` [3, 4]
    it "drop2" $
      drop 0 [1, 2, 3, 4] `shouldBe` [1, 2, 3, 4]
    it "drop3" $
      drop 10 [1, 2, 3, 4] `shouldBe` []
    it "maximum" $
      maximum [1, 9, 2, 3, 4] `shouldBe` 9
    it "minimum" $
      minimum [1, 9, 2, 3, 4] `shouldBe` 1
    it "sum" $
      sum [1, 2, 3, 4] `shouldBe` 10
    it "product" $
      product [1, 2, 3, 4] `shouldBe` 24 
    it "elem" $
      4 `elem` [1, 2, 3, 4] `shouldBe` True 
    it "elem2" $
      5 `elem` [1, 2, 3, 4] `shouldBe` False 
  describe "Range" $ do
    it "Int" $
      [1..3] `shouldBe` [1, 2, 3]
    it "String" $
      ['b'..'d'] `shouldBe` ['b', 'c', 'd']
    it "Step" $
      [2, 1..5] `shouldBe` []
    it "Step2" $
      [2, 4..8] `shouldBe` [2, 4, 6, 8]
    {-
    it "Step3" $
      [2, 2..8] -- 2が永遠に出力される。
    -}
    it "Step4" $
      [5, 4..1] `shouldBe` [5, 4, 3, 2, 1]
    it "Lazy" $
      [13, 26..24 * 13] `shouldBe` take 24 [13, 26..]
    it "cycle" $
      take 10 (cycle [1, 2, 3]) `shouldBe` [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
    it "cycle2" $
      take 3 (cycle ["LOL "]) `shouldBe` ["LOL ", "LOL ", "LOL "]
    it "repeat" $
      take 3 (repeat 5) `shouldBe` [5, 5, 5]
    it "replicate" $
      replicate 3 10 `shouldBe` [10, 10, 10]
  describe "Comprehension" $ do
    it "Example1" $
      [x * 2 | x <- [1..5]] `shouldBe` [2, 4, 6, 8, 10]
    it "Predicate" $
      [x * 2 | x <- [1..5], x * 2 >= 6] `shouldBe` [6, 8, 10]
    it "Predicate2" $
      [x | x <- [1..5], x `mod` 2 /= 0] `shouldBe` [1, 3, 5]
    it "boomBangs" $
      boomBangs [7..13] `shouldBe` ["BOOM!", "BOOM!", "BANG!", "BANG!"]
    it "odd" $
      odd 3 `shouldBe` True
    it "odd2" $
      odd 2 `shouldBe` False
    it "even" $
      even 3 `shouldBe` False
    it "even2" $
      even 2 `shouldBe` True
    it "Example2" $
      [ x | x <- [1..5], x /= 1, x /= 3] `shouldBe` [2, 4, 5]
    it "Example3" $
      [ x + y | x <- [1..3], y <- [10, 20] ] `shouldBe` [11, 21, 12, 22, 13, 23]
    it "Example4" $
      [ x + y | x <- [1..3], y <- [10, 20], x + y > 20 ] `shouldBe` [21, 22, 23]
    it "length'" $
      length' "abc" `shouldBe` 3
    it "removeNonUppercase" $
      removeNonUppercase "aBcDe" `shouldBe` "BD"
    it "List in List" $
      [ [ x | x <- xs, even x ] |
         xs <- [[1, 2, 3], [4, 5, 6]] ]
      `shouldBe` [[2], [4, 6]]
  describe "Tuple" $ do
    it "Example1" $
      fst (1, "a") `shouldBe` 1
    it "Example2" $
      snd (1, "a") `shouldBe` "a"
    it "zip" $
      zip [1, 2, 3] [3, 3, 3] `shouldBe` [(1, 3), (2, 3), (3, 3)]
    it "zip2" $
      zip [1, 2, 3] [3, 3, 3, 3] `shouldBe` [(1, 3), (2, 3), (3, 3)]
    it "zip3" $
      zip [1..] [3, 3, 3, 3] `shouldBe` [(1, 3), (2, 3), (3, 3), (4, 3)]
  describe "rightTriangle" $ do
    it "rightTriangle" $
      head rightTriangle `shouldBe` (6, 8, 10)
      
