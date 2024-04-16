-- public static int increment(int x) {
--   return x + 1;
-- }
increment x = x + 1


-- public static char getFirstCharacter(String s) {
--   return s.charAt(0);
-- }
get_first_character s = head s

-- public static int wordScore(String word) {
--   return word.length();
-- }
word_score word = length word

main = do
  print (increment 1) -- 2
  print (get_first_character "hello") -- 'h'
  print (word_score "hello") -- 5