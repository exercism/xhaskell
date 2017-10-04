module Diamond (diamond) where

import Data.Char (ord, chr)

pad :: Int -> String
pad x = replicate x ' '

helper :: Char -> (Int, Int) -> String
helper c (0, y) = pad y ++ [c] ++ pad y
helper c (x, y) = pad y ++ [c] ++ pad x ++ [c] ++ pad y

diamond :: Char -> [String]
diamond = (\x -> x ++ tail (reverse x)) . f . subtract 64 . ord
  where rows x = zip (0 : take (x-1) [1, 3..]) [x-1, x-2..0]
        f      = zipWith helper abc . rows
        abc    = map chr [65..90]
