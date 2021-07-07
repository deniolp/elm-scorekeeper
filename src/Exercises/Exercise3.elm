module Exercises.Exercise3 exposing (..)

import Debug exposing (toString)
import Html exposing (Html)


main : Html msg
main =
    Html.text (toString newCart)


type alias ItemInCart =
    { name : String
    , qty : Int
    , freeQty : Int
    }


cart : List ItemInCart
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


getBonus : Int -> Int -> ItemInCart -> ItemInCart
getBonus qtyToGetBonus bonus item =
    if item.qty >= qtyToGetBonus && item.freeQty == 0 then
        { item
            | freeQty = bonus
        }

    else
        item


newCart : List ItemInCart
newCart =
    List.map (getBonus 10 3 >> getBonus 5 1) cart
