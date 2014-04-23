import System.Environment
import Data.List

offsetsOnly = 
    putStr
    . intercalate " "
    . map show
    . ( \xs -> zipWith (-) xs (0:xs) )
    . map read

main = offsetsOnly =<< getArgs
