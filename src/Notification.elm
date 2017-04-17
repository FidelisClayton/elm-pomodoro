port module Notification exposing (..)

import Json.Encode

port requestNotificationPermission : Bool -> Cmd msg
port notify : Json.Encode.Value -> Cmd msg
