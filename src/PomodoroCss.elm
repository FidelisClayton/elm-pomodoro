module PomodoroCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (svg, circle, body)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)

type CssClasses
  = Container
  | Clock
  | Timer
  | Buttons
  | Btn
  | Block
  | Circle
  | Green
  | PlayPause
  | Active
  | Disabled

type CssIds
  = Minutes
  | Seconds
  | MinutesIndicator
  | SecondsIndicator
  | Main

css =
  (stylesheet << namespace pomodoroNamespace.name)
  [ body
    [ width (pct 100)
    , height (pct 100)
    , margin zero
    , position absolute
    , displayFlex
    , alignItems center
    , justifyContent center
    , backgroundColor (hex "058B98")
    ]

  , each [ id Minutes, id Seconds ]
    [ transform (rotate (deg 270))

    , children
      [ Css.Elements.circle
        [ property "stroke-dashoffset" "0"
        , property "transition" "stroke-dashoffset 1s linear"
        , property "stroke" "#383F44"
        , property "stroke-width" "2"
        ]
      ]

    , children
      [ each [ id MinutesIndicator, id SecondsIndicator ]
        [ property "stroke" "#OBC5D7"]
      ]
    ]

  , id Main
    [ width (px 300)
    , height (px 400)
    ]

  , class Container
    [ height (pct 100)
    , backgroundColor (hex "2D363C")
    , displayFlex
    , flexDirection column
    , alignItems center
    , margin2 zero auto
    , padding2 (px 30) (px 15)
    , boxShadow5 zero (px 16) (px 25) zero (rgba 0 0 0 0.4)
    , justifyContent spaceBetween
    ]

  , class Clock
    [ width (px 200)
    , height (px 200)
    , position relative

    , children
      [ class Timer
        [ width (pct 100)
        , height (pct 100)
        , displayFlex
        , justifyContent center
        , alignItems center
        , fontSize (pt 20)
        , fontWeight bold
        , fontFamily monospace
        , color (hex "FFF")
        ]

      , each [ id Minutes, id Seconds ]
        [ position absolute
        , left zero
        , right zero
        , top zero
        , bottom zero
        ]
      ]
    ]

  , class Buttons
    [ displayFlex
    , height (px 150)
    , width (pct 100)
    , justifyContent spaceAround
    , flexDirection column
    ]

  , class Btn
    [ height (px 35)
    , border zero
    , backgroundColor (hex "383F44")
    , color (hex "FFF")
    , fontWeight bold
    , boxShadow5 zero (px 16) (px 25) zero (rgba 0 0 0 0.1)
    , fontSize (pt 10)
    , property "transition" "0.3s ease background"
    , outline none

    , children
      [ class Block [ width (pct 100) ]
      , class Circle [ borderRadius (pct 50) ]
      ]

    , withClass Green
      [ backgroundColor (hex "0BC5D7")]

    , withClass Active
      [ backgroundColor (hex "058B98") ]

    , hover
      [ backgroundColor (hex "058B98") ]
    ]

  , class PlayPause
    [ width (px 60)
    , position absolute
    , zIndex (int 10)
    , marginTop (px 44)
    ]
  ]

pomodoroNamespace =
    withNamespace ""
