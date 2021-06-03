module Lib
  ( grid,
    outputGrid,
    formatGrid,
    languages,
    findWordInLine,
    findWords,
  )
where

import Data.List (isInfixOf)
import Data.Maybe (catMaybes)

outputGrid :: [String] -> IO ()
outputGrid grid = putStrLn (formatGrid grid)

formatGrid :: [String] -> String
formatGrid = unlines

findwordMaybe :: [String] -> String -> Maybe String
findwordMaybe grid word =
  let lines = grid ++ (map reverse grid)
      found = or $ map (findWordInLine word) lines
   in if found then Just word else Nothing

findWords grid words =
  let foundWords = map (findwordMaybe grid) words
   in catMaybes foundWords

findWord :: [String] -> String -> Bool
findWord grid word =
  -- lines is the grid and the grid with each line reversed
  let lines = grid ++ (map reverse grid)
   in or $ map (findWordInLine word) lines

findWordInLine :: String -> String -> Bool
findWordInLine word line = word `isInfixOf` line

-- or (map (findWordInLine "HASKELL") grid)
-- findWord (map reverse grid) "PERL"
grid =
  [ "__C________R___",
    "__SI________U__",
    "__HASKELL____B_",
    "__A__A_____S__Y",
    "__R___B___C____",
    "__PHP____H_____",
    "____S_LREP_____",
    "____I__M_Y__L__",
    "____L_E__T_O___",
    "_________HB____",
    "_________O_____",
    "________CN_____"
  ]

languages =
  [ "BASIC",
    "COBOL",
    "CSHARP",
    "HASKELL",
    "LISP",
    "PERL",
    "PHP",
    "PYTHON",
    "RUBY",
    "SCHEME"
  ]