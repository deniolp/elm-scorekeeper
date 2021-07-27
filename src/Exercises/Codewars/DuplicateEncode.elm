module Exercises.Codewars.DuplicateEncode exposing (..)

import Debug exposing (toString)
import Html exposing (text)
import String exposing (..)


main : Html.Html msg
main =
    duplicateEncode "808"
        |> toString
        |> text


duplicateEncode : String -> String
duplicateEncode word_ =
    let
        word =
            String.toLower word_
    in
    String.foldl
        (\c acc ->
            case String.indexes (String.fromChar c) word of
                [ _ ] ->
                    acc ++ "("

                _ ->
                    acc ++ ")"
        )
        ""
        word
