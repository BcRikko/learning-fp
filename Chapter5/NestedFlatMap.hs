-- p.147 5.12 実習:入れ子のflatMap

module NestedFlatMap where

data Point = Point {x :: Int, y :: Int} deriving (Show)

main :: IO ()
main = do
  let ret = concatMap (\x -> map (\y -> Point {x = x, y = y}) [-2, 7, 10]) [1, 2]
  print ret