-- p.121 4.50 実習:カリー化
module Currying where

largerThan :: Int -> Int -> Bool
largerThan n i = i > n

divisibleBy :: Int -> Int -> Bool
divisibleBy n i = i `mod` n == 0

shorterThan :: Int -> String -> Bool
shorterThan n s = length s < n

numberOfS :: String -> Int
numberOfS s = length (filter (== 's') s)

containsS :: Int -> String -> Bool
containsS moreThan s = numberOfS s > moreThan

main :: IO ()
main = do
  let nums = [5, 1, 2, 4, 0]
  print (filter (largerThan 4) nums)

  let nums = [5, 1, 2, 4, 15]
  print (filter (divisibleBy 5) nums)

  let words = ["scala", "ada"]
  print (filter (shorterThan 4) words)

  let words = ["rust", "ada"]
  print (filter (containsS 2) words)