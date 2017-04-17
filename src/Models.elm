module Models exposing (..)

import Time exposing (Time)
import Json.Encode exposing (Value, encode, string, object, null)

import Msgs exposing (Msg)
import Constants

type alias Model =
  { timer : Time
  , elapsed : Time
  , counting : Bool
  , currentMode : Msgs.Modes
  , animate : Int
  }

type alias Notification =
  { title : String
  , body : String
  , icon : Maybe String
  }

initialModel : Model
initialModel =
  { timer = Constants.codeTime
  , elapsed = 0
  , counting = False
  , currentMode = Msgs.Work
  , animate = 1
  }

encodeNotification : Notification -> Value
encodeNotification notification =
  object
    [ ("title", string notification.title)
    , ("body", string notification.body)
    , case notification.icon of
        Just value ->
          ("icon", string value)
        Nothing ->
          ("icon", null)
    ]
