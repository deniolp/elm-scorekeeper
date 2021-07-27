module Exercises.Codewars.SquareDigit exposing (..)

import Debug exposing (toString)
import Html exposing (text)
import String exposing (..)


main : Html.Html msg
main =
    squareDigit 808
        |> toString
        |> text


squareDigit : Int -> Int
squareDigit number =
    String.fromInt number
        |> String.split ""
        |> List.map (\n -> String.fromInt (Maybe.withDefault 0 (String.toInt n) ^ 2))
        |> String.join ""
        |> String.toInt
        |> Maybe.withDefault 0
