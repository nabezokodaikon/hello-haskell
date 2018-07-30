# MEMO
## キーワード
### `<*>`
左辺のリストから関数を1つずつ取り出して、
それぞれを右辺のリストの中の値全てに適用し、
左辺のリストの関数と右辺のリストの値のあらゆる組み合わせを作る。
```
> [(+1), (*100), (*5)] <*> [1, 2, 3]
[2, 3, 4, 100, 200, 300, 5, 10, 15]
```

### `type`
* 型シノニムを作るためのもの。
* 以下のように宣言すれば、`[Int]`型を`IntList`と呼べるようになる。
* 型シノニムは型シグネチャを制してわかりやすくしたいときに使う。
```
type IntList = [Int]
```

### `newtype`
* 既存の型をつつんで新しい型を作るためのもの。
* 型クラスのインスタンスを作りやすくするために使う。
* 既存の方をある型クラスのインスタンスにしたくて、新しい型にくるむ方法を探している場合に使う。
* 元の型とは別物になる。
* 値コンストラクタが1つだけ、フィールドも1つだけという制限のついた`data`宣言とみなしても、実用上は変わらない。

### `data`
* 自作の新しいデータ型を作るためのもの。


## 関数合成
* 関数合成は右結合なので、一度にたくさんの関数を合成できる。
* `f (g (z x))`は、`(f . g . z) x`と等価。
```
map (\x -> negate (abs x)) [1, 2, 3] == map (negate . abs) [1, 2, 3]
```

### 多引数関数の関数合成
```
sum (replicate 5 (max (6, 8))) ==
(sum . replicate 5) (max 6 8) ==
sum . replicate 5 $ max 6 8
```

### たくさん括弧がある式を関数合成で書き直す場合
`replicate 2 (product (map (*3) (zipWith max [1, 2] [4, 5])))`
1. 閉じ括弧の集まりの直前を見て、右端にある関数とその引数を見つける。これを取り出して書き付けておく。
	* `zipWith max [1, 2] [3, 4]`
1. `zipWith max [1, 2] [3, 4]`にどのカンスが適用されているかを調べる。
  * `map (*3)`
1. 取り出した式の間に`$`を置く。
  * `map (*3) $ zipWith max [1, 2] [3, 4]`
1. `map(*3)`に`product`が適用されているので、合成する。
  * `product . map (*3) $ zipWith max [1, 2] [3, 4]`
1. `product`に`replicate 2`が適用されているので、合成する。
  * `replicate 2 product . map (*3) $ zipWith max [1, 2] [3, 4]`

### ポイントフリースタイル
#### 例1
```
sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs
```
イコールの右端の`xs`は関数がカリー化されているため、両側の`xs`は省略できる。
```
sum' :: (Num a) => [a] -> a
sum' foldl (+) 0
```
#### 例2
`fn x = ceiling (negate (tan (cos (max 50 x))))`
1. 関数合成する。
  * `fn x = ceiling . negate . tan . cos . max 50 x`
1. 両端の`x`を取り除く。
  * `fn = ceiling . negate . tan . cos . max 50`



## モノイド則
```
class Monoid m where
    mempty :: m
    mappend :: m -> m -> m
    mconcat :: [m] -> m
    mconcat = foldr mappend mempty
```
モノイドが満たすべき法則。
* 固有の**二項演算**があること。
* その二項演算に関する**単位元**があること。
* `mempty`が`mappend`に関して単位元として振る舞う必要がある。
```
mempty `mappend` x = x
x `mappend` mempty = x
```
* `mappend`が結合的であること。
* 複数の`mappend`で連携つされた式から1つの値を計算するとき、
`mapend`を評価する順序は最終結果に影響しないこと。
```
(x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)
```
