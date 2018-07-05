# hello-haskell
## 参考サイト
### ビルドツール
* [The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/)
* [Haskell Stack](https://haskell.e-bigmoon.com/stack/)

### テスト系
* [HSpec: A Testig Framework for Haskell](https://hspec.github.io/)
* [hspec-example](https://github.com/hspec/hspec-example)
* [Hspec](https://hspec.github.io/)

### 記事
* [本気で Haskell したい人向けの Stack チュートリアル](https://qiita.com/waddlaw/items/49874f4cf9b680e4b015)


## ビルドツール`stack`インストール
### Mac
```
$ brew install haskell-stack
```


## プロジェクト作成
```
$ stack new my-project
$ cd my-project
$ stack setup
$ stack build
```


## REPL
```
$ stack ghci
```


## ビルド & 実行
```
$ stack build

$ stack exec my-project-exe
# または、
$ stack runghc app/Main.hs
```


## HSpec
### ファイルの関連付け
`src`ファイルと`Spec`ファイルを関連付けるために、
`test/Spec.hs`ファイルに以下を記述。(他の行は削除する。)
```
{-# OPTIONS_GHC -F -pgmF hspec-discover #-}
```

### ファイル指定実行
テスト対象ファイルに以下を記述。
```
main :: IO ()
main = hspec spec
```
#### コマンド
```
$ stack runghc test/MathSpec
```

### 一括実行
#### コマンド
```
$ stack test
```


## QuickCheck
TODO


## Memo
### ガード
* 多言語でいうcase文。
* Trueのときのみ評価され、Falseの場合は下へ落ちていく。
* otherwise
```
bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal.\
                   \ Pffft, Ibet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
```

### where
* 使い回す計算結果や関数に名前を付ける。
* 末尾に記述する。
```
bmiTell''' :: Double -> Double -> String
bmiTell''' w h
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal.\
                    \ Pffft, Ibet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = w / h ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0
```
```
bmiTell'''' :: Double -> Double -> String
bmiTell'''' w h
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal.\
                    \ Pffft, Ibet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where bmi = w / h ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)
```
