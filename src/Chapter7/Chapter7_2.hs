module Chapter7.Chapter7_2 where

import qualified Data.Map as Map

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)

mikeD = Person { firstName = "Michael"
               , lastName = "Diamond"
               , age = 43
               }

mysteryDude = "Person {firstName = \"Michael\", lastName = \"Diamond\", age = 43}"

data Day = Monday | Tuesday | Wendnesday | Thursday | Friday |
           Saturday | Sunday
            deriving (Eq, Ord, Show, Read, Bounded, Enum)

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

phoneBook =
  [("betty", "555-2938")
  ,("betty", "555-3000")
  ,("betty", "555-4000")
  ,("bonnie", "452-2928")
  ,("bonnie", "452-4000")
  ,("patsy", "493-2928")
  ]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

type AssocList k v = [(k, v)] 

{- assocMap = [ ("a", 1) -}
           {- , ("b", 2) -}
           {- , ("c", 3) -}
           {- ] :: AssocList String Int -}
assocMap = [ ("a", 1)
           , ("b", 2)
           , ("c", 3)
           ]

{- searchAssoc :: (Ord k) => k -> [(k, v)] -> Maybe v -}
searchAssoc :: (Ord k) => k -> AssocList k v -> Maybe v
searchAssoc k m = Map.lookup k $ Map.fromList m

{- TODO: 使い方がわからない。 -}
{- type IntMap v = Map.Map Int v -}
type IntMap = Map.Map Int

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Integer (LockerState, Code)

lockerMap = Map.fromList [ (1, (Taken, "1234"))
                         , (2, (Free, "5678"))
                         ]

lockerLookup :: Integer -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
  case Map.lookup lockerNumber map of 
    Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
    Just (state, code) -> if state /= Taken
                          then Right code
                          else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"
