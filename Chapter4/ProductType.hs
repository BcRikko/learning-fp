-- p.128 4.57 イミュータブルデータをモデル化する
module ProductType where

data ProgrammingLanguage = ProgrammingLanguage {name :: String, year :: Int}

java = ProgrammingLanguage {name = "Java", year = 1995}

scala = ProgrammingLanguage {name = "Scala", year = 2004}

main :: IO ()
main = do
  print (name java)
  print (year java)

  print (name scala)
  print (year scala)

  print (div (year java + year scala) 2)

  let languages = [java, scala]
  print (map name languages)

  print (map name (filter (\lang -> year lang > 2000) languages))
  print (map name (filter ((> 2000) . year) languages))