port module Alert exposing (..)

import Json.Encode

import Msgs exposing (Msg)
import Models exposing (Model)

port toJs : Bool -> Cmd msg
port requestPermissionToJs : Bool -> Cmd msg
port requestPermissionToElm : (String -> msg) -> Sub msg
port notify : Json.Encode.Value -> Cmd msg
port notificationClick : (String -> msg) -> Sub msg
