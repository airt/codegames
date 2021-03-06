-- https://www.codewars.com/kata/fruit-machine

module Haskell.SylarDoom.FruitMachine where

import Data.List (group, sort, sortOn)

fruit :: [[String]] -> [Int] -> Int
fruit = (score .) . extract

extract :: [[String]] -> [Int] -> [String]
extract = zipWith (!!) . map cycle

score :: [String] -> Int
score items =
  case xitem of
    [x] -> threeOfTheSame x
    ["Wild", x] -> twoOfTheSamePlusOneWild x
    [_, x] -> twoOfTheSame x
    _ -> 0
  where
    xitem = map head . sortOn length . group . sort $ items

threeOfTheSame :: String -> Int
threeOfTheSame = (* 10) . twoOfTheSame

twoOfTheSamePlusOneWild :: String -> Int
twoOfTheSamePlusOneWild = (* 2) . twoOfTheSame

twoOfTheSame :: String -> Int
twoOfTheSame "Wild" = 10
twoOfTheSame "Star" = 9
twoOfTheSame "Bell" = 8
twoOfTheSame "Shell" = 7
twoOfTheSame "Seven" = 6
twoOfTheSame "Cherry" = 5
twoOfTheSame "Bar" = 4
twoOfTheSame "King" = 3
twoOfTheSame "Queen" = 2
twoOfTheSame "Jack" = 1
twoOfTheSame _ = undefined
