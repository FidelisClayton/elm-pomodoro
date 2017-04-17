module Msgs exposing (..)

import Time exposing (Time)

type Modes
  = Work
  | Social
  | Coffee

type Msg
  = Tick Time
  | Play
  | Pause
  | StartWork
  | StartCoffee
  | StartSocial
  | RequestPermission
