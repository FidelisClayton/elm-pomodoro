module Main exposing (..)

import Html exposing (Html, div, text, br, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Time exposing (Time, second)

import Msgs exposing (Msg)
import Models exposing (Model, initialModel)
import Clock.View exposing (clockView)
import Constants
import Update exposing (update)
import Notification
import Helpers exposing (isButtonActive)

init : ( Model, Cmd Msg )
init =
  ( initialModel, Notification.requestNotificationPermission True )

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Msgs.Tick

view : Model -> Html Msg
view model =
  div [ class "container" ]
      [ clockView model
      , div
        [ class "buttons" ]
        [ button
            [ class ("btn btn-block " ++ isButtonActive Msgs.Work model.currentMode)
            , onClick Msgs.StartWork
            ]
            [ text "Work" ]
        , button
            [ class ("btn btn-block " ++ isButtonActive Msgs.Social model.currentMode)
            , onClick Msgs.StartSocial
            ]
            [ text "Social" ]
        , button
            [ class ("btn btn-block " ++ isButtonActive Msgs.Coffee model.currentMode)
            , onClick Msgs.StartCoffee
            ]
            [ text "Coffee" ]
        ]
      ]

main : Program Never Model Msg
main =
  Html.program
  { init = init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }
