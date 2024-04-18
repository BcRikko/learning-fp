-- p.112 4.41 コーヒーブレイク:関数を返す
module CoffeeBreak where

largerThan :: Int -> Int -> Bool
largerThan n =
  \i -> i > n

divisibleBy :: Int -> Int -> Bool
divisibleBy n =
  \i -> i `mod` n == 0

shorterThan :: Int -> String -> Bool
shorterThan n =
  \s -> length s < n

numberOfS :: String -> Int
numberOfS s = length (filter (== 's') s)

containsS :: Int -> String -> Bool
containsS moreThan =
  \s -> numberOfS s > moreThan

main :: IO ()
main = do
  let nums = [5, 1, 2, 4, 0]
  print (filter (largerThan 4) nums)
  print (filter (largerThan 1) nums)

  let nums = [5, 1, 2, 4, 15]
  print (filter (divisibleBy 5) nums)
  print (filter (divisibleBy 2) nums)

  let words = ["scala", "ada"]
  print (filter (shorterThan 4) words)
  print (filter (shorterThan 7) words)

  let words = ["rust", "ada"]
  print (filter (containsS 2) words)
  print (filter (containsS 0) words)