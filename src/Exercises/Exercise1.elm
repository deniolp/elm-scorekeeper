module Exercise1 exposing (..)

import Debug exposing (toString)
import Html exposing (text)
import String exposing (left)


main =
    func "Humour" "Int"
        |> toString
        |> text


func string1 string2 =
    left 1 string1 == left 1 string2
