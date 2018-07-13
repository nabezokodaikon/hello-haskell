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
