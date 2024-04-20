-- p.150 5.15 コーヒーブレイク:flatMapとfor内包表記

module CoffeeBreak where

data Point = Point {x :: Int, y :: Int} deriving (Show)

data Point3D = Point3D {x3d :: Int, y3d :: Int, z3d :: Int} deriving (Show)

main :: IO ()
main = do
  let xs = [1]
  let ys = [-2, 7]
  let zs = [3, 4]

  print $ [Point {x = x, y = y} | x <- xs, y <- ys]
  print $ [Point3D {x3d = x, y3d = y, z3d = z} | x <- xs, y <- ys, z <- zs]
