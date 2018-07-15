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
