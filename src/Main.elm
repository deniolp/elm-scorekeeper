module Main exposing (..)

import Debug exposing (toString)
import Html


main =
    Html.text (toString result)


add a b =
    a + b


result =
    --add (add 1 7) 6
    --add 1 7 |> add 6
    add 1 7 |> (\a -> remainderBy 2 a == 0)
