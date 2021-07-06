module Exercise2 exposing (..)

import Debug exposing (toString)
import Html exposing (text)


main =
    "Here is a test sentence"
        |> wordCount
        |> toString
        |> text


wordCount =
    String.words >> List.length
