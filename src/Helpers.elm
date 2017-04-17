module Helpers exposing (..)

import Msgs
import PomodoroCss exposing (CssClasses)

isButtonActive : Msgs.Modes -> Msgs.Modes -> CssClasses
isButtonActive buttonMode currentMode =
  if buttonMode == currentMode then
    PomodoroCss.Active
  else
    PomodoroCss.Disabled
