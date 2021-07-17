module Annotation exposing (..)

import Debug exposing (toString)
import Html


main : Html.Html msg
main =
    hypotenuse 8 7
        |> toString
        |> Html.text



--half : Float -> Float
--half n =
--    n / 2


hypotenuse : Float -> Float -> Float
hypotenuse a b =
    sqrt (a ^ 2 + b ^ 2)
