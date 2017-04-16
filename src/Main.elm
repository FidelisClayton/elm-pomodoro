module Main exposing (..)

import Html exposing (Html, div, text, br, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Time exposing (Time, second)

import Msgs exposing (Msg)
import Models exposing (Model, initialModel, init)
import Clock.View exposing (clockView)
import Constants
import Update exposing (update)
import Alert

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Time.every second Msgs.Tick
    , Alert.requestPermissionToElm Msgs.UpdateNotificationAccess
    ]

isButtonActive : Msgs.Modes -> Msgs.Modes -> String
isButtonActive buttonMode currentMode =
  if buttonMode == currentMode then
    "active"
  else
    ""

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
