--  p.149 5.14 for内包表記で解決
module ListComprehension where

import Data.List (intercalate)

data Book = Book
  { title :: String,
    authors :: [String]
  }
  deriving (Show)

books =
  [ Book {title = "FP in Scala", authors = ["Chiusano", "Bjarnason"]},
    Book {title = "The Hobbit", authors = ["Tolkien"]},
    Book {title = "Modern Java in Action", authors = ["Urma", "Fusco", "Mycroft"]}
  ]

data Movie = Movie {movieTitle :: String} deriving (Show)

bookAdaptations :: String -> [Movie]
bookAdaptations author =
  if author == "Tolkien"
    then
      [ Movie {movieTitle = "An Unexpected Journey"},
        Movie {movieTitle = "The Desolation of Smaug"}
      ]
    else []

main :: IO ()
main = do
  let ret = ["You may like " ++ movieTitle movie ++ " because you liked " ++ author ++ "'s " ++ title book | book <- books, author <- authors book, movie <- bookAdaptations author]
  print $ ret