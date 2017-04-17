module Main exposing (..)

import Html exposing (Html, div, text, br, button)
import Html.Events exposing (onClick)
import Html.CssHelpers

import Time exposing (Time, second)

import Msgs exposing (Msg)
import Models exposing (Model, initialModel)
import Clock.View exposing (clockView)
import Update exposing (update)
import Notification
import Helpers exposing (isButtonActive)

import PomodoroCss

{ class } =
  Html.CssHelpers.withNamespace ""

init : ( Model, Cmd Msg )
init =
  ( initialModel, Notification.requestNotificationPermission True )

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Msgs.Tick

view : Model -> Html Msg
view model =
  let
    isWork = isButtonActive Msgs.Work model.currentMode
    isSocial = isButtonActive Msgs.Social model.currentMode
    isCoffee = isButtonActive Msgs.Coffee model.currentMode
  in
    div [ class [ PomodoroCss.Container] ]
        [ clockView model
        , div
          [ class [ PomodoroCss.Buttons] ]
          [ button
              [ class [ PomodoroCss.Btn, PomodoroCss.Block, isWork ]
              , onClick Msgs.StartWork
              ]
              [ text "Work" ]
          , button
              [ class [ PomodoroCss.Btn, PomodoroCss.Block, isSocial ]
              , onClick Msgs.StartSocial
              ]
              [ text "Social" ]
          , button
              [ class [ PomodoroCss.Btn, PomodoroCss.Block, isCoffee ]
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
