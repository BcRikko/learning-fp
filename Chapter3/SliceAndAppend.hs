-- p.69 3.19 実習:イミュータブルなスライスとアペンド

module SliceAndAppend where

firstTwo list = take 2 list

lastTwo list = drop (length list - 2) list

-- 複数の変数を使う場合は、ひとつのletでまとめ、inで終わる
movedFirstTwoToTheEnd list =
  let firstTwo = take 2 list
      withoutFirstTwo = drop 2 list
   in withoutFirstTwo ++ firstTwo -- `++`は配列の結合

insertedBeforeLast list element =
  let last = drop (length list - 1) list
      withoutLast = take (length list - 1) list
   in withoutLast ++ [element] ++ last

main = do
  print (firstTwo [1, 2, 3, 4]) -- [1, 2]
  print (lastTwo [1, 2, 3, 4]) -- [3, 4]
  print (movedFirstTwoToTheEnd [1, 2, 3, 4]) -- [3, 4, 1, 2]
  print (insertedBeforeLast [1, 2, 3, 4] 5) -- [1, 2, 3, 5, 4]