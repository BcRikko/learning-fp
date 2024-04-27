-- p.164 5.29 実習:for内包表記

-- cabal install --lib containers
import qualified Data.Set as Set

main :: IO ()
main = do
  print $ [x * y | x <- [1, 2, 3], y <- Set.toList (Set.fromList [1, 2, 3, 4, 5])]
