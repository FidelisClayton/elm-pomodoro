module Helpers exposing (..)

import Msgs

isButtonActive : Msgs.Modes -> Msgs.Modes -> String
isButtonActive buttonMode currentMode =
  if buttonMode == currentMode then
    "active"
  else
    ""
