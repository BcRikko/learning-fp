-- p.150 5.15 コーヒーブレイク:flatMapとfor内包表記

module CoffeeBreak where

data Point = Point {x :: Int, y :: Int} deriving (Show)

data Point3D = Point3D {x3d :: Int, y3d :: Int, z3d :: Int} deriving (Show)

-- p.155 5.20 さらに高度なfor内包表記
isInside :: Point -> Int -> Bool
isInside point radius = radius ^ 2 >= x point ^ 2 + y point ^ 2

main :: IO ()
main = do
  let xs = [1]
  let ys = [-2, 7]
  let zs = [3, 4]

  print $ [Point {x = x, y = y} | x <- xs, y <- ys]
  print $ [Point3D {x3d = x, y3d = y, z3d = z} | x <- xs, y <- ys, z <- zs]

  -- p.156 5.21 for内包表記を使ってすべての組み合わせを確認する
  let points = [Point {x = 5, y = 2}, Point {x = 1, y = 1}]
  let radiuses = [2, 1]

  print $ [show p ++ " is within a radius of  " ++ show r ++ ":" ++ show (isInside p r) | p <- points, r <- radiuses]

  -- p.157 5.22 フィルタリングの方法
  -- filter
  print $
    [ show p ++ " is within a radius of  " ++ show r ++ ":" ++ show (isInside p r)
      | r <- radiuses,
        p <- filter (\p -> isInside p r) points
    ]

  -- ガード式
  print $
    [ show p ++ " is within a radius of  " ++ show r ++ ":" ++ show (isInside p r)
      | r <- radiuses,
        p <- points,
        isInside p r
    ]

  -- p.158 5.23 コーヒーブレイク:フィルタリングの方法
  let points = [Point {x = 5, y = 2}, Point {x = 1, y = 1}]
      riskyRadiuses = [-10, 0, 2]
   in print $
        [ show p ++ " is within a radius of  " ++ show r ++ ":" ++ show (isInside p r)
          | r <- riskyRadiuses,
            p <- points,
            isInside p r
        ]

  -- p.159 5.24 コーヒーブレイクの解説:フィルタリングの方法
  let points = [Point {x = 5, y = 2}, Point {x = 1, y = 1}]
      riskyRadiuses = [-10, 0, 2]
   in print $
        [ show p ++ " is within a radius of  " ++ show r ++ ":" ++ show (isInside p r)
          | r <- riskyRadiuses,
            r > 0,
            p <- points,
            isInside p r
        ]