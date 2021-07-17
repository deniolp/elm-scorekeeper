module Exercises.Exercise2 exposing (..)

import Debug exposing (toString)
import Html exposing (text)


main : Html.Html msg
main =
    "Here is a test sentence"
        |> wordCount
        |> toString
        |> text


wordCount : String -> Int
wordCount =
    String.words >> List.length
