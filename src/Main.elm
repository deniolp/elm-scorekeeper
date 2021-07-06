module Main exposing (..)

import Debug exposing (toString)
import Html


main =
    let
        name =
            "Denis Popov"

        length =
            String.length name
    in
    capitalize 10 name
        ++ " -- name length: "
        ++ toString length
        |> Html.text


capitalize maxLength name =
    if String.length name > maxLength then
        String.toUpper name

    else
        name
