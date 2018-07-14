module Chapter7.Chapter7
( Shape(..)
, area
, Point(..)
, Shape'(..)
, area'
, nudge
, baseCircle
, baseRect
, Person(..)
, firstName
, Car(..)
, Car'(..)
, tellCar
, tellCar'
, Vector(..)
, vplus
, dotProd
, vmult
) where

data Shape = Circle Float Float Float |
             Rectangle Float Float Float Float
  deriving (Show, Eq)

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

data Point = Point Float Float
  deriving (Show, Eq)

data Shape' = Circle' Point Float |
              Rectangle' Point Point
  deriving (Show, Eq)

area' :: Shape' -> Float
area' (Circle' _ r) = pi * r ^ 2
area' (Rectangle' (Point x1 y1) (Point x2 y2)) =
                 (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape' -> Float -> Float -> Shape'
nudge (Circle' (Point x y) r) a b = Circle' (Point (x + a) (y + b)) r
nudge (Rectangle' (Point x1 y1) (Point x2 y2)) a b =
  Rectangle' (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

baseCircle :: Float -> Shape'
baseCircle r = Circle' (Point 0 0) r

baseRect :: Float -> Float -> Shape'
baseRect w h = Rectangle' (Point 0 0) (Point w h)

data Person = Person String String Int Float String String
  deriving (Show, Eq)

firstName :: Person -> String
firstName (Person v _ _ _ _ _) = v

data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show, Eq)

data Car' a b c = Car' { company' :: a
                       , model' :: b
                       , year' :: c
                       } deriving (Show, Eq)

tellCar :: Car -> String
tellCar (Car { company = c, model = m, year = y }) =
  "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

tellCar' :: (Show a) => Car' String String a -> String
tellCar' (Car' { company' = c, model' = m, year' = y }) =
  "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

data Vector a = Vector a a a deriving (Show, Eq)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i + l) (j + m) (k + n)

dotProd :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i * l + j * m + k * n

vmult :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vmult` (Vector l m n) = Vector (i * l) (j * m) (k * n)
