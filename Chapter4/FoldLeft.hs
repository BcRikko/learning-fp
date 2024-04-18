-- p.127 4.56 実習:foldLeft
module FoldLeft where

numberOfS :: String -> Int
numberOfS s = length (filter (== 's') s)

main :: IO ()
main = do
  print (foldl (\sum i -> sum + i) 0 [5, 1, 2, 4, 100])

  print (foldl (\total s -> total + length s) 0 ["scala", "rust", "ada"])

  print (foldl (\total str -> total + numberOfS str) 0 ["scala", "haskell", "rust", "ada"])

  print (foldl (\max i -> if i > max then i else max) 0 [5, 1, 2, 4, 15])
