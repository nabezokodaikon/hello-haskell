module Chapter7.Chapter7_2 where

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
