module Main exposing (..)

import Html exposing (Html, div, text, br, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Time exposing (Time, second)

import Msgs exposing (Msg)
import Models exposing (Model, initialModel)
import Clock.View exposing (clockView)
import Constants

startTimer : Float -> Msgs.Modes -> Model
startTimer timer mode =
  { initialModel
  | timer = timer
  , counting = True
  , currentMode = mode
  }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Msgs.Tick time ->
      if model.counting then
        let
          elapsed = model.elapsed + second
          newModel = { model | elapsed = elapsed }
        in
          ( newModel, Cmd.none )
      else
        ( model, Cmd.none )

    Msgs.StartWork ->
      ( startTimer Constants.codeTime Msgs.Work, Cmd.none )

    Msgs.StartCoffee ->
      ( startTimer Constants.coffeeTime Msgs.Coffee, Cmd.none )

    Msgs.StartSocial ->
      ( startTimer Constants.socialTime Msgs.Social, Cmd.none )

    Msgs.Play ->
      ( { model | counting = True }, Cmd.none )

    Msgs.Pause ->
      ( { model | counting = False }, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Msgs.Tick

secondsCounter : Model -> String
secondsCounter model =
  toString <| floor((model.timer * 60000) - (Time.inMilliseconds model.elapsed)) % 60

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
  { init = Models.init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }
