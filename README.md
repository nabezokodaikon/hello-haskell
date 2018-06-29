# hello-haskell
## ビルドツール公式サイト
* [The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/)


## 参考サイト
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


## テスト実行
```
$ stack test
```


## HSpec
TODO


## QuickCheck
TODO
