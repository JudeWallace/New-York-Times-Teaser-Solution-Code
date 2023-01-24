-- any imports go here
import Data.List

{-Begin Question 2.1-}
number :: [Int] -> Int
number = foldl ((+).(*10)) 0
{-End Question 2.1-}

{-Begin Question 2.2-}
splits :: [Int] -> [([Int],[Int])]
splits [] 
  = []
splits [x] 
  = []
splits (x : xs) 
  = ([x], xs) : map f (splits xs)
    where
    f (a, b) = (x : a, b)

possibles :: [([Int],[Int])]
possibles
  = [(x) | y <- permutations [1..9], x <- splits(y)]
{-End Question 2.2-}

{-Begin Question 2.3-}
digits :: Int -> [Int]
digits x
  | x < 10 = [x]
  | otherwise = digits (div x 10) ++ [mod x 10]

isPalindrome :: Int -> Bool
isPalindrome x
  = y == reverse y
    where
    y = digits x

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable ([],[])
  = False
isAcceptable (x,[])
  = False
isAcceptable ([],y)
  = False
isAcceptable (x,y)
  | a > b && palindromehead == 4 && ytail == 3 && isPalindrome palindrome == True = True
  | b > a && palindromehead == 4 && xtail == 3 && isPalindrome palindrome == True = True
  | otherwise = False
    where 
    a = number(x)
    b = number(y)
    palindrome = a * b
    todigits = digits(palindrome)
    palindromehead = head todigits
    xtail = last x
    ytail = last y

acceptables :: [([Int],[Int])]
acceptables
  = [(x,y) | (x,y) <- possibles, isAcceptable(x,y) == True]
{-End Question 2.3-}

-- any main functions for testing goes here

main :: IO()
main
  = putStrLn(show(length $ acceptables))
