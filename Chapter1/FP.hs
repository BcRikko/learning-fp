-- p.14 1.11 実習:Scalaで関数を書く

module FP where

-- public static int increment(int x) {
--   return x + 1;
-- }
increment x = x + 1


-- public static char getFirstCharacter(String s) {
--   return s.charAt(0);
-- }
getFirstCharacter s = head s

-- public static int wordScore(String word) {
--   return word.length();
-- }
wordScore word = length word

main = do
  print (increment 1) -- 2
  print (getFirstCharacter "hello") -- 'h'
  print (wordScore "hello") -- 5