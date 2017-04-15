port module Alert exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)

port toJs : Bool -> Cmd msg
