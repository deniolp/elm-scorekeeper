module Knowthen.Calculator exposing (..)

-- model

import Browser
import Debug exposing (toString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.sandbox { init = initModel, update = update, view = view }


type alias Model =
    { calories : Int
    , input : Int
    , error : Maybe String
    }


initModel : Model
initModel =
    Model 0 0 Nothing



-- update


type Msg
    = AddCalorie
    | Input String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model
                | calories = model.calories + model.input
                , input = 0
            }

        Input val ->
            case val |> String.toInt of
                Just input ->
                    { model
                        | input = input
                        , error = Nothing
                    }

                Nothing ->
                    { model
                        | input = 0
                        , error = Just (toString "Something in input is wrong")
                    }

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ toString model.calories) ]
        , input
            [ type_ "text"
            , onInput Input
            , value
                (if model.input == 0 then
                    ""

                 else
                    toString model.input
                )
            ]
            []
        , div [] [ text (Maybe.withDefault "" model.error) ]
        , button
            [ type_ "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]
