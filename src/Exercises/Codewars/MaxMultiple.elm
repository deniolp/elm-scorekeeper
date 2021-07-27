module Exercises.Codewars.MaxMultiple exposing (..)

import Debug exposing (toString)
import Html exposing (text)
import String exposing (..)


main : Html.Html msg
main =
    maxMultiple 2 7
        |> toString
        |> text


maxMultiple : Int -> Int -> Int
maxMultiple d b =
    b - remainderBy d b
