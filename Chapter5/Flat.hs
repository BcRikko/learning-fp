module Flat where

import Data.Function ((&))

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

data Movie = Movie String deriving (Show)

bookAdaptations :: String -> [Movie]
bookAdaptations author =
  if author == "Tolkien"
    then
      [ Movie "An Unexpected Journey",
        Movie "The Desolation of Smaug"
      ]
    else []

-- recommendationFeed :: [Book] -> [String]
-- recommendationFeed books =
--   map bookAdaptations
--   map (\book -> "You may like " ++ title book ++ " because you liked ") books

recommendedBooks :: String -> [Book]
recommendedBooks friend =
  let scala =
        [ Book {title = "FP in Scala", authors = ["Chiusano", "Bjarnason"]},
          Book {title = "Get Programming with Scala", authors = ["Sfregola"]}
        ]
      fiction =
        [ Book {title = "Harry Potter", authors = ["Rowling"]},
          Book {title = "The Lord of the Rings", authors = ["Tolkien"]}
        ]
   in if friend == "Alice"
        then scala
        else
          if friend == "Bob"
            then fiction
            else []

main :: IO ()
main = do
  -- p.139 5.4 flattenとflatMap
  -- flatten
  print $ books & map authors & concat
  -- flatMap
  print $ concatMap authors books

  -- p.144 5.9 連結されたflatMapとmap（let authors より前でないとエラーになる）
  print $ books & concatMap authors & concatMap bookAdaptations

  -- p.140 5.5 flatMapの実践的な例
  let authors = ["Chiusano", "Bjarnason", "Tolkien"]
  print $ map bookAdaptations authors & concat
  print $ concatMap bookAdaptations authors

  -- p.142 5.7 コーヒーブレイク:リストのリストを処理する
  let friends = ["Alice", "Bob", "Charlie"]
  print $ friends & concatMap recommendedBooks & map title

-- print $ recommendationFeed books