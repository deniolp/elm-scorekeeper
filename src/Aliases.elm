module Aliases exposing (..)

import Debug exposing (toString)
import Html


main : Html.Html msg
main =
    isOldEnoughToVote { name = "Bob", age = 15 }
        |> toString
        |> Html.text


type alias User =
    { name : String
    , age : Int
    }


isOldEnoughToVote : User -> Bool
isOldEnoughToVote user =
    user.age >= 18
