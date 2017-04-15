module PomodoroCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (svg, circle)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)

type CssClasses
  = RadialCenter

css =
  (stylesheet << namespace pomodoroNamespace.name)
  [ svg
    [ position relative
    , display inlineBlock
    , backgroundColor (hex "000")
    ]
  , Css.Elements.circle
    [ property "stroke-width" "1em"
    , fill transparent
    , property "stroke" "#DEDEDE"
    ]
  ]

pomodoroNamespace =
    withNamespace ""
