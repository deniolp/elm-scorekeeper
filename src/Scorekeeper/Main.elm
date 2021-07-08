module Scorekeeper.Main exposing (..)

import Browser
import Debug exposing (toString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- model


type alias Model =
    { players : List Player
    , name : String
    , playerId : Maybe Int
    , plays : List Play
    }


type alias Player =
    { id : Int
    , name : String
    , points : Int
    }


type alias Play =
    { id : Int
    , playerId : Int
    , name : String
    , points : Int
    }


initModel : Model
initModel =
    Model [] "" Nothing []



-- update


type Msg
    = Edit Player
    | Score Player Int
    | Input String
    | Save
    | Cancel
    | DeletePlay Play


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input name ->
            Debug.log "Input updated model"
                { model | name = name }

        Cancel ->
            { model | name = "", playerId = Nothing }

        Save ->
            if String.isEmpty model.name then
                model

            else
                save model

        _ ->
            model


save : Model -> Model
save model =
    case model.playerId of
        Just id ->
            edit model id

        Nothing ->
            add model


edit : Model -> Int -> Model
edit model id =
    let
        newPlayers =
            List.map
                (\player ->
                    if player.id == id then
                        { player | name = model.name }

                    else
                        player
                )
                model.players

        newPlays =
            List.map
                (\play ->
                    if play.playerId == id then
                        { play | name = model.name }

                    else
                        play
                )
                model.plays
    in
    { model
        | players = newPlayers
        , plays = newPlays
        , playerId = Nothing
        , name = ""
    }


add : Model -> Model
add model =
    let
        player =
            Player (List.length model.players) model.name 0

        newPlayers =
            player :: model.players
    in
    { model
        | players = newPlayers
        , name = ""
    }



-- view


view : Model -> Html Msg
view model =
    div [ class "scoreboard" ]
        [ h1 [] [ text "Score Keeper" ]
        , playerForm model
        , p [] [ text (toString model) ]
        ]


playerForm : Model -> Html Msg
playerForm model =
    Html.form [ onSubmit Save ]
        [ input
            [ type_ "text"
            , placeholder "Add/Edit Player..."
            , onInput Input
            , value model.name
            ]
            []
        , button [ type_ "submit" ] [ text "Save" ]
        , button [ type_ "button", onClick Cancel ] [ text "Cancel" ]
        ]


main =
    Browser.sandbox { init = initModel, update = update, view = view }
