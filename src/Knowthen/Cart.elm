module Knowthen.Cart exposing (..)

import Debug exposing (toString)
import Html exposing (Html)


main : Html msg
main =
    Html.text (toString newCart)


type alias Item =
    { name : String
    , price : Float
    , qty : Int
    , discounted : Bool
    }


cart : List Item
cart =
    [ { name = "Lemon", price = 0.5, qty = 1, discounted = False }
    , { name = "Apple", price = 1.0, qty = 5, discounted = False }
    , { name = "Pear", price = 1.25, qty = 10, discounted = False }
    ]



--fiveOrMoreDiscount item =
--    if item.qty >= 5 then
--        { item
--            | price = item.price * 0.8
--            , discounted = True
--        }
--
--    else
--        item


discount : Int -> Float -> Item -> Item
discount minQty dscPct item =
    if item.qty >= minQty && not item.discounted then
        { item
            | price = item.price * (1 - dscPct)
            , discounted = True
        }

    else
        item



--newCart =
--    List.map fiveOrMoreDiscount cart


newCart : List Item
newCart =
    List.map (discount 10 0.3 >> discount 5 0.2) cart
