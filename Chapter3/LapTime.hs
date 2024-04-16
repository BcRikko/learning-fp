-- p.54 3.7 コーヒーブレイク:可変性で痛い目を見る
module LapTime where

totalTime lapTimes =
  sum (tail lapTimes)

avgTime lapTimes = totalTime lapTimes / fromIntegral (length lapTimes)

main = do
  print (totalTime [1, 2, 3]) -- 5
  print (avgTime [2, 4, 6]) -- 3.33333...
