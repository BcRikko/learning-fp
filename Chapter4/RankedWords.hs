module RankedWords where

import Data.List (sortBy)

removeA :: String -> String
removeA word = filter (\c -> c /= 'a') word

score :: String -> Int
score word = length (removeA word)

includeC :: String -> Bool
includeC word = 'c' `elem` word

scoreWithBonus :: String -> Int
scoreWithBonus word =
  let baseScore = score word
      bonus = if includeC word then 5 else 0
   in baseScore + bonus

-- p.91 4.20 小さな関数とそれらの役割
bonus :: String -> Int
bonus word = if includeC word then 5 else 0

includeS :: String -> Bool
includeS word = 's' `elem` word

scoreWithBonusAndPenalty :: String -> Int
scoreWithBonusAndPenalty word =
  let baseScoreWithBonus = scoreWithBonus word
      penalty = if includeS word then 7 else 0
   in baseScoreWithBonus - penalty

penalty :: String -> Int
penalty word = if includeS word then 7 else 0

rankedWords :: (String -> Int) -> [String] -> [String]
rankedWords wordScore words =
  let comparator w1 w2 = compare (wordScore w1) (wordScore w2)
   in sortBy comparator words

wordScores :: (String -> Int) -> [String] -> [Int]
wordScores wordScore words = map wordScore words

highScoringWords :: (String -> Int) -> [String] -> Int -> [String]
highScoringWords wordScore words =
  \higherThan -> filter (\w -> wordScore w > higherThan) words

cumulativeScore :: (String -> Int) -> [String] -> Int
cumulativeScore wordScore words =
  foldl (\total word -> total + wordScore word) 0 words

main :: IO ()
main = do
  let words = ["haskell", "ada", "java", "scala", "rust"]
  print (map score words)
  print (rankedWords score words)

  -- p.76 4.5 要件を変更する
  print (map scoreWithBonus words)
  print (rankedWords scoreWithBonus words)

  -- p.81 4.10 コーヒーブレイク:パラメータとしての関数
  print (map scoreWithBonusAndPenalty words)
  print (rankedWords scoreWithBonusAndPenalty words)

  -- p.89 4.18 宣言型プログラミングを取り入れる
  print (reverse (rankedWords score words))

  -- p.93 4.22 コーヒーブレイク:Scalaで関数を渡す
  print (rankedWords (\w -> score w + bonus w - penalty w) words)

  -- p.96 4.24 リストの各要素に関数を適用する
  print (wordScores (\w -> score w + bonus w - penalty w) words)

  -- p.110 4.39 関数を返すことができる関数を使う
  -- print (highScoringWords ((\w -> score w + bonus w - penalty w) words 1)
  
   -- p.124 4.53 foldLeftを使って多くの値を1つに減らす
   print (cumulativeScore (\w -> score w + bonus w - penalty w) words)