import System.Environment

sizes [] = []
sizes (x:y:xs)
    | null xs   = [z]
    | otherwise = [z] ++ (sizes $ [y]++xs) 
    where z = y - x

main = do
    offsets <- getArgs
    print
        $ sizes
        $ [0] ++ map (\x -> read x :: Int ) offsets
