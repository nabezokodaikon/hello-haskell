# hello-haskell
## 参考サイト
### ビルドツール
* [The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/)
* [Haskell Stack](https://haskell.e-bigmoon.com/stack/)

### テスト系
* [HSpec: A Testig Framework for Haskell](https://hspec.github.io/)

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
### ファイル指定実行
`test/Spec.hs`に以下を記述。(`stack init`のデフォルト)
```
main :: IO ()
main = putStrLn "Test suite not yet implemented"
```

#### コマンド
```
$ stack runghc test/MathSpec
```

### 一括実行
`src`ファイルと`Spec`ファイルを関連付けるために、
`test/Spec.hs`ファイルに以下を記述。(他の行は削除する。)
```
{-# OPTIONS_GHC -F -pgmF hspec-discover #-}
```

#### 例
* `src/Math.hs`
* `test/MathSpec.hs`

#### コマンド
```
$ stack test
```


## QuickCheck
TODO
