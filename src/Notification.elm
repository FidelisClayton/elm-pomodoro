port module Notification exposing (..)

import Json.Encode

import Msgs exposing (Msg)
import Models exposing (Model)

port requestNotificationPermission : Bool -> Cmd msg
port notify : Json.Encode.Value -> Cmd msg
