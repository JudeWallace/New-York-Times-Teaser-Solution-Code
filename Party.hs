-- any imports go here

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits x
  | x < 10 = [x]
  | otherwise = digits (div x 10) ++ [mod x 10]
{-End Question 1.1-}

{-Begin Question 1.2-}
foldList :: [Int] -> Int
foldList = foldl ((+).(*10)) 0

noZeros :: [Int] -> Bool
noZeros []
  = True
noZeros xs
  | 0 `elem` xs = False
  | otherwise   = True

noDuplicates :: [Int] -> Bool
noDuplicates []
  = True
noDuplicates (x:xs)
  = x `notElem` xs && noDuplicates xs
  
isPar :: Int -> Bool
isPar x
  | repeats && zeros && b `mod` a == 0 = True
  | otherwise    = False
    where
    repeats = noDuplicates (digits x)
    zeros = noZeros (digits x)
    (as, bs) = splitAt 2 (digits x)
    a = foldList as
    b = foldList bs

pars :: [Int]
pars 
  = [x | x <- [1000..9999], isPar x]
{-End Question 1.2-}

{-Begin Question 1.3-}
pairToList :: (Int, Int) -> [[Int]]
pairToList (x,y) 
  = [digits x, digits y]

concatList :: [[Int]] -> [Int] 
concatList
  = foldr (++) []

missingDigit :: [Int] -> Int
missingDigit []
  = 0
missingDigit xs
  = 45 - sum xs

checkMultiple :: Int -> Int -> Bool
checkMultiple a b
  | b > 0 && a `mod` b == 0 = True
  | otherwise      = False

isParty :: (Int, Int) -> Bool
isParty (x, y)
  | xcheck && ycheck && norepeats = True
  | otherwise = False
    where
    listxy = concatList(pairToList (x,y))
    missing = missingDigit(listxy)
    norepeats = noDuplicates(listxy)
    xcheck = checkMultiple x missing 
    ycheck = checkMultiple y missing 

partys :: [(Int, Int)]
partys
  = [(x,y) | x <- pars, y <- pars, isParty (x,y)]
{-End Question 1.3-}

-- any main functions for testing goes here

main :: IO()
main
  = putStrLn(show (partys))
