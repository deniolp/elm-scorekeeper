module Exercises.Exercise3 exposing (..)

import Debug exposing (toString)
import Html exposing (Html)


main : Html msg
main =
    List.map (getBonus 10 3 >> getBonus 5 1) cart
        |> toString
        |> Html.text


type alias ItemInCart =
    { name : String
    , qty : Int
    , freeQty : Int
    }


cart : List ItemInCart
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 20, freeQty = 0 }
    ]


getBonus : Int -> Int -> ItemInCart -> ItemInCart
getBonus qtyToGetBonus bonus item =
    if item.qty >= qtyToGetBonus && item.freeQty == 0 then
        { item
            | freeQty = item.qty // qtyToGetBonus * bonus
        }

    else
        item
