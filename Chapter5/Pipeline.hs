-- p.136 5.1 パイプラインに基づくアルゴリズムを作成する
module Pipeline where

import Data.Function ((&))
import Data.List (isInfixOf)

data Book = Book
  { title :: String,
    authors :: [String]
  }

books =
  [ Book {title = "FP in Scala", authors = ["Chiusano", "Bjarnason"]},
    Book {title = "The Hobbit", authors = ["Tolkien"]},
    Book {title = "Modern Java in Action", authors = ["Urma", "Fusco", "Mycroft"]}
  ]

main :: IO ()
main = do
  print $ length $ filter (isInfixOf "Scala") $ map title $ books
  print $ books & map title & filter (isInfixOf "Scala") & length
