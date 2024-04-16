-- p.44 2.21 コーヒーブレイク:純粋関数のテスト

module TestCoffeeBreak where
import Test.HUnit
import CoffeeBreak

test_increment = TestCase $ do
  assertEqual "increment 1" 2 (increment 1)
  assertEqual "increment 0" 1 (increment 0)
  assertEqual "increment -1" 0 (increment (-1))

test_getFirstCharacter = TestCase $ do
  assertEqual "getFirstCharacter abc" 'a' (getFirstCharacter "abc")
  assertEqual "getFirstCharacter def" 'd' (getFirstCharacter "def")

test_wordScore = TestCase $ do
  assertEqual "wordScore \"abc\"" 3 (wordScore "abc")
  assertEqual "wordScore \"def\"" 3 (wordScore "def")
  assertEqual "wordScore \"\"" 0 (wordScore "")

main =
  runTestTT (test [
    test_increment,
    test_getFirstCharacter,
    test_wordScore
  ])