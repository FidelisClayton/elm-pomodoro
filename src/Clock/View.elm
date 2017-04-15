module Clock.View exposing (..)

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (id, class)
import Html.Events exposing (onClick)
import Css exposing (property)
import Svg exposing (Svg, circle, svg)
import Svg.Attributes exposing (height, width, r, cx, cy, fill, strokeDasharray, strokeDashoffset)
import Time exposing (Time)

import Models exposing (Model)
import Msgs exposing (Msg)
import Util exposing (paddValue)

styles =
    Css.asPairs >> Html.Attributes.style

secondsView : Model -> Html Msg
secondsView model =
  let
    elapsedSeconds = floor (Time.inSeconds model.elapsed) % 120

    radius = 85
    circumference = 2 * pi * radius
    percentage = toFloat (elapsedSeconds * 100) / 60
    amount = ( ( 100 - percentage ) / 100 ) * circumference
  in
    svg
      [ id "seconds"
      , width "200px"
      , height "200px"
      ]
      [ circle
        [ r <| toString radius
        , cx "100"
        , cy "100"
        , fill "transparent"
        , strokeDasharray <| toString circumference
        , strokeDashoffset "0"
        ] []
      , circle
        [ id "seconds-indicator"
        , r <| toString radius
        , cx "100"
        , cy "100"
        , fill "transparent"
        , strokeDasharray <| toString circumference
        , strokeDashoffset "0"
        , styles [ property "stroke-dashoffset" (toString amount) ]
        ] []
      ]

minutesView : Model -> Html Msg
minutesView model =
  let
    elapsedSeconds = floor (Time.inSeconds model.elapsed)

    radius = 90
    circumference = 2 * pi * radius
    percentage = toFloat (elapsedSeconds * 100) / (model.timer / 1000)
    amount = ( ( 100 - percentage ) / 100 ) * circumference
  in
    svg
      [ id "minutes"
      , width "200px"
      , height "200px"
      ]
      [ circle
        [ r <| toString radius
        , cx "100"
        , cy "100"
        , fill "transparent"
        , strokeDasharray <| toString circumference
        , strokeDashoffset "0"
        ] []
      , circle
        [ id "minutes-indicator"
        , r <| toString radius
        , cx "100"
        , cy "100"
        , fill "transparent"
        , strokeDasharray <| toString circumference
        , strokeDashoffset "0"
        , styles [ property "stroke-dashoffset" (toString amount) ]
        ] []
      ]

timerView : Model -> Html Msg
timerView model =
  let
    elapsedMinutes = floor (Time.inMinutes model.elapsed) % 60 + 1
    elapsedSeconds = floor (Time.inSeconds model.elapsed) % 60 + 1

    minutes = ( floor (Time.inMinutes model.timer) - elapsedMinutes ) % 60
    seconds = ( floor (Time.inSeconds model.timer) - elapsedSeconds ) % 60
  in
    div []
        [ text (paddValue (toString minutes) ++ ":" ++ paddValue (toString seconds)) ]

clockView : Model -> Html Msg
clockView model =
  div [ class "clock"]
      [ div
          [ class "timer" ]
          [ timerView model
          , if model.counting then
              button [ class "btn green play-pause", onClick Msgs.Pause ] [ text "Pause" ]
            else
              button [ class "btn green play-pause", onClick Msgs.Play ] [ text "Start" ]
          ]
      , secondsView model
      , minutesView model
      ]
