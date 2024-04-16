-- p.42 2.19 実習:Scalaで純粋関数を書く

-- class TipCalculator {
--   public static int getTipPercentage(List<String> names) {
--     if (names.size() > 5) {
--       return 20;
--     } else if (name.size() > 0) {
--       return 10;
--     } else {
--       return 0;
--     }
--   }
-- }

module TipCalculator where

getTipPercentage names =
  if length names > 5
    then 20
  else if length names > 0
    then 10
  else
    0

main = do
  print (getTipPercentage ["a", "b", "c", "d", "e", "f"]) -- 20
  print (getTipPercentage ["a", "b", "c", "d", "e"]) -- 10
  print (getTipPercentage ["a"]) -- 10
  print (getTipPercentage []) -- 0