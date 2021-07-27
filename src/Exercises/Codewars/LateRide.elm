module Exercises.Codewars.LateRide exposing (..)

import Debug exposing (toString)
import Html exposing (text)
import String exposing (..)


main : Html.Html msg
main =
    lateRide 808
        |> toString
        |> text


lateRide : Int -> Int
lateRide n =
    String.split "" (String.fromInt (truncate (Basics.toFloat n / 60)))
        ++ String.split "" (String.fromInt (remainderBy 60 n))
        |> List.map (\it -> Maybe.withDefault 0 (String.toInt it))
        |> List.foldl (+) 0
