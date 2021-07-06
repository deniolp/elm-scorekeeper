module Annotation exposing (..)

import Debug exposing (toString)
import Html


main =
    half 8
        |> toString
        |> Html.text


half : Float -> Float
half n =
    n / 2
